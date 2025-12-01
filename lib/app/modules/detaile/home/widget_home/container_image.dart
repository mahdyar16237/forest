import 'package:flutter/material.dart';
import 'package:forest/app/core/constants/app_colors.dart';

Widget containerImage() {
  return Container(
    width: 200,
    height: 200,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.homeProgressTrack,
          AppColors.homeProgressMid,
          AppColors.homeProgressEnd,
        ],
      ),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // نوار خاکی در پایین
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(100),
              ),
              color: AppColors.homeSoil.withOpacity(0.85),
            ),
          ),
        ),
        // تصویر گیاه
        SizedBox(
          width: 120,
          height: 120,
          child: Image.asset('assets/images/seedling.png', fit: BoxFit.contain),
        ),
      ],
    ),
  );
}
