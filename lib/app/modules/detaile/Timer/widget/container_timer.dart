import 'package:flutter/material.dart';

Widget timerCircle({
  required BuildContext context,
  required double progress,
  required String timeLabel,
}) {
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
            backgroundColor: const Color(0xFFD8C89A),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4C8A4B)),
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
                color: const Color(0xFF2C382C),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/seedling.png',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    ),
  );
}
