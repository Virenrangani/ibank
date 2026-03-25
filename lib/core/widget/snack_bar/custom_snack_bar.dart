import 'package:flutter/material.dart';
import '../../constant/border/custom_border_radius.dart';
import '../../constant/color/custom_color.dart';
import '../../constant/font_size/custom_text_style.dart';

class CustomSnacksBar {

  static void showSuccess(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle,
    );
  }

  static void showError(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: AppColors.error,
      icon: Icons.error,
    );
  }

  static void showInfo(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: AppColors.info,
      icon: Icons.info,
    );
  }

  static void showSnackBar(
      BuildContext context,
      String message,
      {
        required Color backgroundColor,
        required IconData icon,
      }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: 6,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: CustomBorderRadius.cir16,
        ),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            Icon(icon, color: AppColors.surface),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodySmall
              ),
            ),
          ],
        ),
      ),
    );
  }
}