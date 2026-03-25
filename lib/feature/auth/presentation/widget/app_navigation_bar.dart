import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/constant/color/custom_color.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/string/custom_string.dart';
import '../page/signup_page.dart';

class AppNavigationBar extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onTap;
  const AppNavigationBar({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1, style: AppTextStyles.caption()),
        Gap(10),
        InkWell(
          onTap:onTap,
          child: Text(text2, style: AppTextStyles.captionMedium(color: AppColors.primary)),
        ),
      ],
    );
  }
}
