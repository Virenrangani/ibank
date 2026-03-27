import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import '../../../../core/constant/border/custom_border_radius.dart';
import '../../../../core/constant/color/custom_color.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/image/app_image.dart';
import 'card_data.dart';

class VisaCard extends StatelessWidget {
  final CardData data;
  const VisaCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal:24),
        height:240,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: CustomBorderRadius.cir16,
            color: data.cardColor
        ),
        child: AspectRatio(
          aspectRatio: 16/10,
          child:ClipRRect(
            borderRadius:CustomBorderRadius.cir16 ,
            child: Stack(
              children: [
                Positioned(
                  top:-28,
                  left:-100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: data.circleColorRight,
                        shape: BoxShape.circle
                    ),
                    height: 380,
                    width: 380,
                  ),
                ),
                Positioned(
                  top: 20,
                  left:16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name, style: AppTextStyles.h1),
                      const Gap(30),
                      Text(data.cardType, style: AppTextStyles.h3),
                      const Gap(16),
                      Text(data.cardNumber, style: AppTextStyles.h2Normal(fontWeight: FontWeight.w400)),
                      const Gap(8),
                      Text(
                        data.balance,
                        style: AppTextStyles.caption(
                          color: AppColors.background,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom:80,
                  right: -150,
                  child: Container(
                    decoration: BoxDecoration(
                        color: data.circleColorLeft,
                        shape: BoxShape.circle
                    ),
                    height: 260,
                    width: 260,
                  ),
                ),
                Positioned(
                    bottom:24,
                    right:20,
                    child: SizedBox(
                        height: 25,
                        width:60,
                        child: Image.asset(AppImage.visa,)
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
