import 'package:flutter/material.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import '../../constant/border/custom_border_radius.dart';
import '../../constant/color/custom_color.dart';

class CustomFormField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final bool obscureText;
  final int maxLines;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;

  const CustomFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffix,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.onSuffixTap,
    this.onChanged,
    this.borderColor,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      maxLines: obscureText ? 1 : maxLines,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.descriptionLarge,
        prefixIcon: prefixIcon != null
            ? Padding(
              padding: EdgeInsetsGeometry.only(left: 12,top: 16, bottom: 16),
              child: prefixIcon,
            )
            : null,
        suffixIcon: suffix != null
            ? InkWell(
                onTap: onSuffixTap,
                child: Padding(padding: AppPadding.edgeAll12, child: suffix),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: CustomBorderRadius.cir16,
          borderSide: BorderSide(color: AppColors.textLight, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: CustomBorderRadius.cir16,
          borderSide: BorderSide(color: AppColors.textSecondary, width: 1.5),
        ),
        border: OutlineInputBorder(borderRadius: CustomBorderRadius.cir16),
      ),
    );
  }
}
