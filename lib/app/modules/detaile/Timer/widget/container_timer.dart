import 'package:flutter/material.dart';
import 'package:forest/app/core/constants/app_colors.dart';

Widget timerCircle({
  required BuildContext context,
  required double progress,
  required String timeLabel,
}) {
  // Calculating image size
  final imageSize = 60.0 + (progress * 60.0);

  // show me tree after 50%
  final imagePath = progress > 0.5
      ? 'assets/images/tree.png'
      : 'assets/images/seedling.png';

  return SizedBox(
    width: 260,
    height: 260,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: CircularProgressIndicator(
            strokeWidth: 14,
            value: progress,
            backgroundColor: AppColors.timerTrack,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.timerProgress,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timeLabel,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: AppColors.timerLabel,
              ),
            ),
            const SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: imageSize,
              height: imageSize,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ],
        ),
      ],
    ),
  );
}
