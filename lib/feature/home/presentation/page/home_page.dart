import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/constant/border/custom_border_radius.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import 'package:ibank/core/constant/string/custom_string.dart';
import 'package:ibank/core/image/app_image.dart';
import 'package:ibank/feature/home/presentation/widget/notification_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Gap(65),
            Row(
              children: [
                Gap(30),
                SizedBox(
                  height:60,
                  width: 60,
                  child: Image.asset(AppImage.avatar,fit:BoxFit.fill),
                ),
                Gap(25),
                Expanded(child: Text(AppStrings.welcomeMessage,style: AppTextStyles.h2Normal,)),
                NotificationIcon(),
                Gap(30)
              ],
            ),
            Gap(25),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: CustomBorderRadius.verTop32
              ),
              child: Column(
                children: [
                  Gap(22),
                  AspectRatio(
                      aspectRatio: 16/10,
                      child: Image.asset(AppImage.card,fit: BoxFit.fitWidth,)
                  ),
                  Padding(
                    padding: AppPadding.edgeAll28,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          crossAxisSpacing: 20,
                            mainAxisSpacing: 20
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: 9,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: CustomBorderRadius.cir12,
                              color: AppColors.background,
                              boxShadow: [BoxShadow(
                                color: AppColors.border,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              )]
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
