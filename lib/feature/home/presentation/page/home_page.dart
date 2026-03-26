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
  final List<Map<String,dynamic>> bankService=[
    {
      'image':AppImage.b1,
      'title':AppStrings.accountCard
    },
    {
      'image':AppImage.b2,
      'title':AppStrings.transfer
    },
    {
      'image':AppImage.b3,
      'title':AppStrings.withdraw
    },
    {
      'image':AppImage.b4,
      'title':AppStrings.mobilePrepaid
    },
    {
      'image':AppImage.b5,
      'title':AppStrings.payBill
    },
    {
      'image':AppImage.b6,
      'title':AppStrings.saveOnline
    },
    {
      'image':AppImage.b7,
      'title':AppStrings.creditCard
    },
    {
      'image':AppImage.b8,
      'title':AppStrings.transactionReport
    },
    {
      'image':AppImage.b9,
      'title':AppStrings.beneficiary
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
      body:SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Gap(40),
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
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          shrinkWrap: true,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(bankService[index]['image'],fit: BoxFit.cover,),
                                  ),
                                  Gap(10),
                                  Text(
                                    bankService[index]['title'], style: AppTextStyles.titleSmall,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
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
      ),
    );
  }
}
