import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:forest/app/modules/detaile/Statistics/models/daily_statistic.dart';
import 'package:forest/app/modules/detaile/Statistics/models/statistics_chart_data.dart';

class StatisticsController extends GetxController {
  final _storage = GetStorage();
  static const String _allTimeKey = 'all_time_minutes';

  final RxList<DailyStatistic> dailyStats = <DailyStatistic>[].obs;
  final RxInt weeklyHours = 0.obs;
  final RxInt weeklyMinutes = 0.obs;
  final RxInt allTimeMinutes = 0.obs;
  final RxInt todayMinutes = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Validate and fix statistics on initialization
    // This ensures All-Time is always calculated correctly from daily stats
    _loadStatistics();
    // Validate to fix any inconsistencies
    _validateAndFixAllTime();
  }

  /// Validate and fix All-Time statistics
  void _validateAndFixAllTime() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    int calculatedAllTime = 0;

    // Calculate from all daily stats (last 365 days)
    for (int i = 0; i < 365; i++) {
      final date = today.subtract(Duration(days: i));
      final dateKey = _getDateKey(date);
      final minutes = _storage.read<int>(dateKey) ?? 0;
      calculatedAllTime += minutes;
    }

    // Update stored value to match calculated value
    final storedAllTime = _storage.read<int>(_allTimeKey) ?? 0;
    if (storedAllTime != calculatedAllTime) {
      _storage.write(_allTimeKey, calculatedAllTime);
      allTimeMinutes.value = calculatedAllTime;
    }
  }

  StatisticsChartData get chartData =>
      StatisticsChartData(dailyStats: dailyStats.toList());

  void _loadStatistics() {
    _loadWeeklyStats();
    _loadAllTime();
    _loadTodayMinutes();
  }

  void _loadWeeklyStats() {
    final now = DateTime.now();
    // Normalize to midnight and calculate week start (Monday)
    final today = DateTime(now.year, now.month, now.day);
    final daysFromMonday = (today.weekday - 1) % 7;
    final weekStart = today.subtract(Duration(days: daysFromMonday));

    final List<DailyStatistic> stats = [];
    int totalMinutes = 0;

    for (int i = 0; i < 7; i++) {
      final date = weekStart.add(Duration(days: i));
      final dateKey = _getDateKey(date);
      final minutes = _storage.read<int>(dateKey) ?? 0;

      final dayLabel = _getDayLabel(date.weekday);
      stats.add(DailyStatistic(day: dayLabel, value: minutes.toDouble()));
      totalMinutes += minutes;
    }

    dailyStats.assignAll(stats);
    weeklyHours.value = totalMinutes ~/ 60;
    weeklyMinutes.value = totalMinutes % 60;
  }

  void _loadAllTime() {
    // Calculate All-Time from all daily statistics instead of stored value
    // This ensures accuracy and prevents duplicate data
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    int totalAllTime = 0;

    // Sum up all daily statistics from the last 365 days
    for (int i = 0; i < 365; i++) {
      final date = today.subtract(Duration(days: i));
      final dateKey = _getDateKey(date);
      final minutes = _storage.read<int>(dateKey) ?? 0;
      totalAllTime += minutes;
    }

    // Update stored value to match calculated value
    _storage.write(_allTimeKey, totalAllTime);
    allTimeMinutes.value = totalAllTime;
  }

  void _loadTodayMinutes() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final todayKey = _getDateKey(today);
    todayMinutes.value = _storage.read<int>(todayKey) ?? 0;
  }

  String _getDateKey(DateTime date) {
    return 'focus_${date.year}_${date.month}_${date.day}';
  }

  String _getDayLabel(int weekday) {
    // weekday: 1=Monday, 2=Tuesday, ..., 7=Sunday
    // Return localized full day names
    switch (weekday) {
      case 1:
        return 'monday'.tr;
      case 2:
        return 'tuesday'.tr;
      case 3:
        return 'wednesday'.tr;
      case 4:
        return 'thursday'.tr;
      case 5:
        return 'friday'.tr;
      case 6:
        return 'saturday'.tr;
      case 7:
        return 'sunday'.tr;
      default:
        return '';
    }
  }

  void saveFocusSession(int minutes) {
    if (minutes <= 0) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final todayKey = _getDateKey(today);
    final currentToday = _storage.read<int>(todayKey) ?? 0;
    _storage.write(todayKey, currentToday + minutes);

    // Update All-Time by recalculating from all days (more accurate)
    // This ensures All-Time always matches the sum of all daily statistics
    final currentAllTime = _storage.read<int>(_allTimeKey) ?? 0;
    _storage.write(_allTimeKey, currentAllTime + minutes);

    // Reload statistics to ensure everything is in sync
    _loadStatistics();
  }

  void updateDailyStats(List<DailyStatistic> stats) {
    if (stats.isEmpty) return;
    dailyStats.assignAll(stats);
  }

  void updateWeeklySummary({int? hours, int? minutes}) {
    if (hours != null) {
      weeklyHours.value = hours;
    }
    if (minutes != null) {
      weeklyMinutes.value = minutes;
    }
  }

  void updateAllTimeMinutes(int minutes) {
    allTimeMinutes.value = minutes;
  }

  /// Clear all statistics data (useful for debugging or reset)
  void clearAllStatistics() {
    // Clear all daily statistics
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Clear last 30 days of data
    for (int i = 0; i < 30; i++) {
      final date = today.subtract(Duration(days: i));
      final dateKey = _getDateKey(date);
      _storage.remove(dateKey);
    }

    // Clear all-time statistics
    _storage.remove(_allTimeKey);

    // Reload statistics
    _loadStatistics();
  }

  /// Validate and fix statistics data
  void validateStatistics() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Recalculate all-time from all daily stats
    int calculatedAllTime = 0;

    // Check last 365 days
    for (int i = 0; i < 365; i++) {
      final date = today.subtract(Duration(days: i));
      final dateKey = _getDateKey(date);
      final minutes = _storage.read<int>(dateKey) ?? 0;
      calculatedAllTime += minutes;
    }

    // Update all-time if it doesn't match
    final storedAllTime = _storage.read<int>(_allTimeKey) ?? 0;
    if (storedAllTime != calculatedAllTime) {
      _storage.write(_allTimeKey, calculatedAllTime);
    }

    // Reload statistics
    _loadStatistics();
  }
}
