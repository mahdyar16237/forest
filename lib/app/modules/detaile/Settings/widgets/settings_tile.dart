import 'package:flutter/material.dart';
import 'package:forest/app/core/constants/app_colors.dart';

Widget settingsTile({
  required IconData icon,
  required String title,
  String? trailingText,
  Widget? trailing,
  VoidCallback? onTap,
  bool showChevron = false,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(28),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.settingsIconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.timerPrimary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          if (trailing != null) ...[
            trailing,
          ] else if (trailingText != null) ...[
            Text(
              trailingText,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          if (showChevron || onTap != null)
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(Icons.chevron_right, color: Colors.grey),
            ),
        ],
      ),
    ),
  );
}
