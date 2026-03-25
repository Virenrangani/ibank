import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constant/color/custom_color.dart';
import '../../constant/font_size/custom_text_style.dart';
import '../../constant/padding/custom_padding.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final bool hasBackButton;
  const CustomAppBar({
    super.key,
    required this.text,
    this.color=AppColors.textSecondary,
    this.textStyle=AppTextStyles.titleLarge,
    this.hasBackButton = true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.edgeAll20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(hasBackButton)...[
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, color: color)),
          Gap(8),
          ],
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
