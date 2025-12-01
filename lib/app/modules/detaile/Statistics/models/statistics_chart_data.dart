import 'package:forest/app/modules/detaile/Statistics/models/daily_statistic.dart';

class StatisticsChartData {
  StatisticsChartData({required this.dailyStats, this.maxBarHeight = 150.0});

  final List<DailyStatistic> dailyStats;
  final double maxBarHeight;

  List<String> get labels =>
      dailyStats.map((stat) => stat.day).toList(growable: false);

  List<double> get values =>
      dailyStats.map((stat) => stat.value).toList(growable: false);

  double get _maxValue {
    if (values.isEmpty) return 100.0;
    return values.reduce((a, b) => a > b ? a : b);
  }

  double get _scaleFactor => _maxValue > 0 ? maxBarHeight / _maxValue : 1.0;

  List<double> get scaledHeights => values
      .map((value) => (value * _scaleFactor).clamp(0.0, maxBarHeight))
      .toList(growable: false);

  bool get hasData => dailyStats.isNotEmpty;

  static StatisticsChartData empty() =>
      StatisticsChartData(dailyStats: const []);
}
