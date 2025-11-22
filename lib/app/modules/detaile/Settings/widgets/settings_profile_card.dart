import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget settingsProfileCard({
  required String name,
  required String email,
  required VoidCallback onEdit,
}) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color(0xFFE5F2E3),
          child: Icon(Icons.person, color: Colors.green.shade700, size: 50),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: onEdit,
          child: Text(
            'edit_profile'.tr,
            style: const TextStyle(
              color: Color(0xFF2F6B32),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
