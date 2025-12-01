import 'package:flutter/material.dart';
import 'package:forest/app/core/constants/app_colors.dart';

Widget statsHeading(String text) => Text(
  text,
  style: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
);

Widget statsSection(String text) => Text(
  text,
  style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  ),
);

Widget statsValueLarge(String text) => Text(
  text,
  style: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
);

Widget statsValueMedium(String text) => Text(
  text,
  style: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
);

Widget statsLabel(String text) => Text(
  text,
  style: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  ),
);
