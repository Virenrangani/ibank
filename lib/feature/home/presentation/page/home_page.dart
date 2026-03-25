import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/string/custom_string.dart';
import 'package:ibank/core/image/app_image.dart';

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
      body:Column(
        children: [
          Gap(70),
          Row(
            children: [
              Gap(30),
              SizedBox(
                height:60,
                width: 60,
                child: Image.asset(AppImage.avatar,fit:BoxFit.fill),
              ),
              Gap(25),
              Text(AppStrings.welcomeMessage,style: AppTextStyles.h2Normal,),
            ],
          )
        ],
      ),

    );
  }
}
