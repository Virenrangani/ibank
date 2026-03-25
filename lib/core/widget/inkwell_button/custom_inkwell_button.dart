import 'package:flutter/material.dart';
import 'package:ibank/core/constant/border/custom_border_radius.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import '../../constant/color/custom_color.dart';

class CustomInkwellButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? color;

  const CustomInkwellButton({
    super.key,
    required this.text,
    required this.onTap,
     this.textStyle=AppTextStyles.button,
    this.isLoading=false,
    this.width,
    this.height = 48,
    this.color=AppColors.primary,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.primaryContainer,
      child: Container(
        height:height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: CustomBorderRadius.cir16,
          color: color
        ),
        child: Ink(
          child: isLoading ? SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.border,
            ),
          ): Center(child: Text(text,style:textStyle,))
        ),
      ),
    );
  }
}