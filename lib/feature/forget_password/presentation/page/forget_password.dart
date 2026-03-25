import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/core/constant/border/custom_border_radius.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/widget/custom_app_bar/custom_app_bar.dart';
import 'package:ibank/feature/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:ibank/feature/forget_password/presentation/page/forget_password_otp_page.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/padding/custom_padding.dart';
import '../../../../core/constant/string/custom_string.dart';
import 'package:gap/gap.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import 'package:ibank/core/widget/elevated_button/custom_elevated_button.dart';

import '../cubit/forget_password_state.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ForgetPasswordCubit(),
  child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:Column(
        children:[
          Gap(60),
          CustomAppBar(text: AppStrings.forget),
               Container(
                margin: EdgeInsets.all(20),
                padding: AppPadding.edgeAll20,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: CustomBorderRadius.cir20,
                  boxShadow: [BoxShadow(
                    color: AppColors.border,
                    blurRadius: 4,
                  )]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.mobileTitle,style: AppTextStyles.titleMedium,),
                    Gap(20),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomFormField(
                        keyboardType: TextInputType.number,
                        controller: mobileController,
                        prefixIcon: Text(AppStrings.mobileHint,style: mobileController.text.isEmpty
                            ? AppTextStyles.descriptionLarge : AppTextStyles.body,
                        ),
                        onChanged: (val){
                            context.read<ForgetPasswordCubit>().mobileNumberVerification(val);
                        },
                        validator:(_)=>context.read<ForgetPasswordCubit>().mobileNumberError,
                      ),
                    ),
                    Gap(28),
                    Text(AppStrings.forgetDescription,style:AppTextStyles.body,),
                    Gap(24),
                    CustomElevatedButton(
                        text: AppStrings.send,
                        isEnabled: context.read<ForgetPasswordCubit>().isFormValid,
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>ForgetPasswordOtpPage())
                            );
                          }
                        }
                    ),
                  ],
                ),
              ),
        ]
      )
    );
  },
),
);
  }
}


