import 'package:flutter/material.dart';

Widget timerActionButton({
  required BuildContext context,
  required String label,
  required Color color,
  required VoidCallback onTap,
}) {
  return SizedBox(
    height: 48,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      onPressed: onTap,
      child: Text(label),
    ),
  );
}
