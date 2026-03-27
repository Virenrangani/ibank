import 'package:flutter/cupertino.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/image/app_image.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:32,
      width: 32,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 26,
              width: 26,
              child: Image.asset(AppImage.bell),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.error
              ),
              child: Center(child: Text("1",style: AppTextStyles.buttonMedium,)),
            ),
          )
        ],
      ),
    );
  }
}
