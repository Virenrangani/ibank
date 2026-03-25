import 'package:flutter/material.dart';
import '../color/custom_color.dart';

class AppTextStyles {

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.background
  );

  static const TextStyle h3Bold = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryContainer
  );

  static const TextStyle h4 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryContainer
  );

  static const TextStyle h5 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryContainer,
  );

  static const TextStyle body = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary
  );

  static TextStyle caption({Color color = AppColors.textSecondary}) => TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: color
  );

  static TextStyle captionMedium({Color color = AppColors.primaryContainer}) => TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color
  );

  static TextStyle captionBold({Color color = AppColors.primaryContainer}) => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color
  );

  static const TextStyle titleLarge = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textSecondary
  );
  static const TextStyle titleMedium = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.titleLight
  );
  static const TextStyle  descriptionLarge= TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textLight
  );

  static const TextStyle descriptionMedium=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primary
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primary
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary
  );
  static const TextStyle titleSmall = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.titleLight
  );

  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.background
  );
  static const TextStyle buttonMedium = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.background
  );

}