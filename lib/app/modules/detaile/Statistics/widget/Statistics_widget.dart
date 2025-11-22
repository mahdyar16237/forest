import 'package:flutter/material.dart';
import 'package:forest/app/core/constants/app_colors.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({
    super.key,
    required this.dayLabels,
    required this.dayValues,
  });

  final List<String> dayLabels;
  final List<double> dayValues;

  @override
  Widget build(BuildContext context) {
    final int itemCount = dayLabels.length <= dayValues.length
        ? dayLabels.length
        : dayValues.length;

    if (itemCount == 0) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(itemCount, (index) {
          final double value = dayValues[index];
          final String day = dayLabels[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                width: 30,
                height: value,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F6B32),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                day,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
