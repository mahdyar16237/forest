import 'package:get/get.dart';

class DailyStatistic {
  const DailyStatistic({required this.day, required this.value});

  final String day;
  final double value;
}

class StatisticsController extends GetxController {
  final RxList<DailyStatistic> dailyStats = <DailyStatistic>[
    const DailyStatistic(day: 'M', value: 40),
    const DailyStatistic(day: 'T', value: 55),
    const DailyStatistic(day: 'W', value: 55),
    const DailyStatistic(day: 'T', value: 70),
    const DailyStatistic(day: 'F', value: 80),
    const DailyStatistic(day: 'S', value: 100),
  ].obs;

  final RxInt weeklyHours = 4.obs;
  final RxInt weeklyMinutes = 12.obs;
  final RxInt allTimeMinutes = 25.obs;

  List<String> get dayLabels =>
      dailyStats.map((stat) => stat.day).toList(growable: false);

  List<double> get dayValues =>
      dailyStats.map((stat) => stat.value).toList(growable: false);

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
}
