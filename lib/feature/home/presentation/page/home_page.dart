import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/constant/border/custom_border_radius.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import 'package:ibank/core/constant/string/custom_string.dart';
import 'package:ibank/core/image/app_image.dart';
import 'package:ibank/feature/home/presentation/widget/card_animation.dart';
import 'package:ibank/feature/home/presentation/widget/grid_card.dart';
import 'package:ibank/feature/home/presentation/widget/notification_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
      body:SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Gap(20),
              Row(
                children: [
                  Gap(30),
                  SizedBox(
                    height:60,
                    width: 60,
                    child: Image.asset(AppImage.avatar,fit:BoxFit.fill),
                  ),
                  Gap(25),
                  Expanded(child: Text(AppStrings.welcomeMessage,style: AppTextStyles.h2Normal(),)),
                  NotificationIcon(),
                  Gap(30)
                ],
              ),
              Gap(32),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: CustomBorderRadius.verTop32
                ),
                child: Column(
                  children: [
                    Gap(24),
                    CardAnimation(),
                    Gap(18),
                    Padding(
                      padding: AppPadding.edgeAll24,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            crossAxisSpacing: 20,
                              mainAxisSpacing: 20
                          ),
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return GridCard(index:index);
                          }
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
