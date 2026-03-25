import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/string/custom_string.dart';
import 'package:ibank/core/image/app_image.dart';
import 'package:ibank/core/widget/inkwell_button/custom_inkwell_button.dart';
import '../../../../core/constant/padding/custom_padding.dart';

class ChangePasswordSuccess extends StatelessWidget {
  const ChangePasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: AppPadding.edgeAll20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(60),
            Align(
              alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios))
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height*0.35,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(AppImage.passwordImage,fit:BoxFit.fill,),
            ),Gap(30),
            Text(AppStrings.changePassSuccess,style: AppTextStyles.bodyLarge,),
            Gap(25),
            Text(AppStrings.changePassSuccessDescription1,style: AppTextStyles.body,),
            Text(AppStrings.changePassSuccessDescription2,style: AppTextStyles.body,),
            Gap(30),
            CustomInkwellButton(
                text: AppStrings.ok,
                onTap: (){}
            )
          ],
        ),
      ),
    );
  }
}

