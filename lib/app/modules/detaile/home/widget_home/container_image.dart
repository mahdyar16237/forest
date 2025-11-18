import 'package:flutter/material.dart';

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
          Color(0xFFE9F4E1), // سبز خیلی روشن بالا
          Color(0xFFD8EDC8), // میانه
          Color(0xFFC9E3AE), // پایین
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
              color: const Color(0xFFA67C52).withOpacity(0.85),
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
