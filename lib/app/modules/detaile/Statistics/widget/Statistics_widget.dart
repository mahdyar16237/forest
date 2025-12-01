import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forest/app/core/constants/app_colors.dart';
import 'package:forest/app/modules/detaile/Statistics/Statistics_controller/Statistics_controller.dart';

Widget statisticsChart({required StatisticsController controller}) {
  return Obx(() {
    final chartData = controller.chartData;
    final labels = chartData.labels;
    final heights = chartData.scaledHeights;

    if (!chartData.hasData || labels.isEmpty || heights.isEmpty) {
      return const SizedBox.shrink();
    }

    final itemCount = labels.length <= heights.length
        ? labels.length
        : heights.length;

    return SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(itemCount, (index) {
          final String day = labels[index];
          final double scaledHeight = heights[index];
          // Ensure minimum height of 2 pixels to avoid rendering issues
          final double displayHeight = scaledHeight > 0 ? scaledHeight : 2.0;

          return Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  width: 30,
                  height: displayHeight,
                  decoration: BoxDecoration(
                    color: scaledHeight > 0
                        ? AppColors.statsBar
                        : AppColors.statsBar.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  });
}
