import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:forest/app/modules/detaile/Settings/Settings_controller/Settings_controller.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_controller/Statistics_controller.dart';

class TimerController extends GetxController {
  Timer? _timer;
  final RxInt remainingSeconds = 0.obs;
  final RxBool isRunning = false.obs;
  final RxBool isPaused = false.obs;
  int totalSeconds = 0;
  int lastSavedMinute =
      -1; // Keeps track of the last full minute logged in stats

  final _storage = GetStorage();
  static const String _timerStateKey = 'timer_state';
  static const String _remainingSecondsKey = 'timer_remaining_seconds';
  static const String _totalSecondsKey = 'timer_total_seconds';
  static const String _isRunningKey = 'timer_is_running';
  static const String _isPausedKey = 'timer_is_paused';
  static const String _startTimestampKey = 'timer_start_timestamp';

  Worker? _focusDurationWorker;

  @override
  void onInit() {
    super.onInit();
    _restoreTimerState();
    _listenToFocusDurationChanges();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _initializeTimer() {
    final settingsController = Get.find<SettingsController>();
    final focusMinutes = settingsController.focusMinutes.value;
    totalSeconds = focusMinutes * 60;
    remainingSeconds.value = totalSeconds;
    lastSavedMinute = -1; // Reset saved minute counter
    _clearSavedState();
  }

  void _listenToFocusDurationChanges() {
    final settingsController = Get.find<SettingsController>();
    _focusDurationWorker = ever<int>(settingsController.focusMinutes, (
      minutes,
    ) {
      final newTotalSeconds = minutes * 60;
      totalSeconds = newTotalSeconds;

      // Only update remaining time when timer is idle
      if (!isRunning.value && !isPaused.value) {
        remainingSeconds.value = newTotalSeconds;
        lastSavedMinute = -1;
        _clearSavedState();
      }
    });
  }

  void _restoreTimerState() {
    final hasSavedState = _storage.read<bool>(_timerStateKey) ?? false;

    if (hasSavedState) {
      final savedRemaining = _storage.read<int>(_remainingSecondsKey);
      final savedTotal = _storage.read<int>(_totalSecondsKey);
      final savedIsRunning = _storage.read<bool>(_isRunningKey) ?? false;
      final savedIsPaused = _storage.read<bool>(_isPausedKey) ?? false;
      final savedStartTimestamp = _storage.read<int>(_startTimestampKey);

      if (savedRemaining != null && savedTotal != null) {
        totalSeconds = savedTotal;

        // If timer run = Calculate.
        if (savedIsRunning && savedStartTimestamp != null) {
          final now = DateTime.now().millisecondsSinceEpoch;
          final elapsedSecondsSinceSave = ((now - savedStartTimestamp) / 1000)
              .floor();
          final newRemaining = savedRemaining - elapsedSecondsSinceSave;

          if (newRemaining > 0) {
            remainingSeconds.value = newRemaining;
            isRunning.value = true;
            isPaused.value = false;
            // Start counting from "now" because we've already subtracted elapsed time
            _storage.write(_startTimestampKey, now);
            _syncLastSavedMinute(totalSeconds - newRemaining);

            _startTicker();
          } else {
            // Timer finished while the app was closed
            remainingSeconds.value = 0;
            isRunning.value = false;
            isPaused.value = false;
            _clearSavedState();
            _onTimerComplete();
          }
        } else if (savedIsPaused) {
          // Restore paused state
          remainingSeconds.value = savedRemaining;
          isRunning.value = false;
          isPaused.value = true;
          _syncLastSavedMinute(totalSeconds - savedRemaining);
          _saveTimerState();
        } else {
          // Nothing special, just restore the counter
          remainingSeconds.value = savedRemaining;
          isRunning.value = false;
          isPaused.value = false;
          _syncLastSavedMinute(totalSeconds - savedRemaining);
          _clearSavedState();
        }
      } else {
        _initializeTimer();
      }
    } else {
      _initializeTimer();
    }
  }

  void _saveTimerState() {
    saveTimerState();
  }

  void saveTimerState() {
    _storage.write(_timerStateKey, true);
    _storage.write(_remainingSecondsKey, remainingSeconds.value);
    _storage.write(_totalSecondsKey, totalSeconds);
    _storage.write(_isRunningKey, isRunning.value);
    _storage.write(_isPausedKey, isPaused.value);
    // Update start timestamp when timer is running
    if (isRunning.value) {
      // If timestamp doesn't exist or timer was just resumed, set it to now
      final currentTimestamp = _storage.read<int>(_startTimestampKey);
      if (currentTimestamp == null) {
        _storage.write(
          _startTimestampKey,
          DateTime.now().millisecondsSinceEpoch,
        );
      }
    } else {
      // Clear timestamp when timer is not running
      _storage.remove(_startTimestampKey);
    }
  }

  void _clearSavedState() {
    _storage.remove(_timerStateKey);
    _storage.remove(_remainingSecondsKey);
    _storage.remove(_totalSecondsKey);
    _storage.remove(_isRunningKey);
    _storage.remove(_isPausedKey);
    _storage.remove(_startTimestampKey);
  }

  void startTimer() {
    if (remainingSeconds.value == 0) {
      _initializeTimer();
    }

    if (_timer?.isActive ?? false) {
      return;
    }

    isRunning.value = true;
    isPaused.value = false;

    _startTicker();
  }

  void pauseTimer() {
    _timer?.cancel();
    isRunning.value = false;
    isPaused.value = true;
    _saveTimerState();
  }

  void resumeTimer() {
    if (isPaused.value && remainingSeconds.value > 0) {
      isRunning.value = true;
      isPaused.value = false;
      // Clear old timestamp so _saveTimerState will set a new one
      _storage.remove(_startTimestampKey);
      _startTicker();
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    isRunning.value = false;
    isPaused.value = false;
  }

  void resetTimer() {
    _stopTimer();
    _initializeTimer();
    _clearSavedState();
  }

  void cancelTimer() {
    _stopTimer();
    remainingSeconds.value = 0;
    _clearSavedState();
    // Tree dies when cancelled
    Get.snackbar(
      'timer_cancelled'.tr,
      'tree_died'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void completeTimer() {
    _stopTimer();
    // When user clicks "Done", save the full timer duration (e.g., 25 minutes)
    // minus any minutes already saved during real-time counting
    if (totalSeconds > 0) {
      final totalMinutes = totalSeconds ~/ 60;
      // Calculate how many minutes have already been saved during real-time counting
      final alreadySavedMinutes = lastSavedMinute >= 0
          ? lastSavedMinute + 1
          : 0;
      // Calculate remaining minutes to save (full timer duration - already saved)
      final minutesToSave = totalMinutes - alreadySavedMinutes;

      if (minutesToSave > 0) {
        // Save all remaining minutes to complete the full timer duration
        for (int i = 0; i < minutesToSave; i++) {
          _saveSingleMinute();
        }
        lastSavedMinute = totalMinutes - 1;
      }
    }

    _clearSavedState();
    // Reset timer for next session instead of setting to 0
    _initializeTimer();
    // Successful completion
    Get.snackbar(
      'timer_complete'.tr,
      'focus_session_complete'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _onTimerComplete() {
    _stopTimer();
    // All minutes should have been saved already during timer countdown
    // Just save the last minute if needed
    final elapsedSeconds = totalSeconds - remainingSeconds.value;
    if (elapsedSeconds > 0 && elapsedSeconds % 60 == 0) {
      // A full minute just completed
      final currentMinute = elapsedSeconds ~/ 60;
      if (currentMinute != lastSavedMinute) {
        _saveSingleMinute();
      }
    }
    _clearSavedState();
    // Reset timer for next session instead of setting to 0
    _initializeTimer();
    Get.snackbar(
      'timer_complete'.tr,
      'focus_session_complete'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _startTicker() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), _handleTick);
    _saveTimerState();
  }

  void _handleTick(Timer timer) {
    if (remainingSeconds.value > 0) {
      remainingSeconds.value--;
      _checkAndSaveMinute();
      _saveTimerState();
    } else {
      _onTimerComplete();
    }
  }

  void _syncLastSavedMinute(int elapsedSeconds) {
    if (elapsedSeconds < 0) {
      lastSavedMinute = -1;
      return;
    }
    lastSavedMinute = elapsedSeconds ~/ 60;
  }

  /// Check if a full minute has passed and save it to statistics
  void _checkAndSaveMinute() {
    if (totalSeconds > 0 && isRunning.value) {
      final elapsedSeconds = totalSeconds - remainingSeconds.value;
      final currentMinute = elapsedSeconds ~/ 60;

      // If a full minute has passed that we haven't saved yet
      if (currentMinute > lastSavedMinute && elapsedSeconds % 60 == 0) {
        _saveSingleMinute();
        lastSavedMinute = currentMinute;
      }
    }
  }

  /// Save a single minute to statistics
  void _saveSingleMinute() {
    try {
      if (Get.isRegistered<StatisticsController>()) {
        final statsController = Get.find<StatisticsController>();
        statsController.saveFocusSession(1); // Save exactly 1 minute
      }
    } catch (e) {
      // StatisticsController might not be registered yet
    }
  }

  String get formattedTime {
    final minutes = remainingSeconds.value ~/ 60;
    final seconds = remainingSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get progress {
    if (totalSeconds == 0) return 0.0;
    return 1.0 - (remainingSeconds.value / totalSeconds);
  }

  @override
  void onClose() {
    // Save state before closing (if timer is running or paused)
    if (isRunning.value || isPaused.value) {
      _saveTimerState();
    }
    _timer?.cancel();
    _focusDurationWorker?.dispose();
    super.onClose();
  }
}
