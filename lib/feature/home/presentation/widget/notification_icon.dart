import 'package:flutter/cupertino.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/image/app_image.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(AppImage.bell),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.error
            ),
          ),
        )
      ],
    );
  }
}
