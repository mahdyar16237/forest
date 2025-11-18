import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget todayTreeCard(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 24),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF9BC28C).withOpacity(0.9),
      borderRadius: BorderRadius.circular(28),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF6A9F6C),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.eco, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              'todays Tree'.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFF234123),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: 0.6,
            minHeight: 10,
            backgroundColor: Colors.white.withOpacity(0.4),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1F4D1F)),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: Text(
            '25:00',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: const Color(0xFF234123),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
