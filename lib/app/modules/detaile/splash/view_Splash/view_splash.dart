import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewSplash extends StatelessWidget {
  const ViewSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //icon app
            Icon(Icons.forest, size: 100, color: Colors.green.shade700),
            const SizedBox(height: 20),
            //App name using translation
            Text(
              'app_name'.tr,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            //text loading
            Text(
              'splash_loading'.tr,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 40),
            // Loading indicator
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
