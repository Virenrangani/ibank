import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/widget/custom_app_bar/custom_app_bar.dart';
import 'package:ibank/core/widget/inkwell_button/custom_inkwell_button.dart';
import 'package:ibank/feature/change_password/presentation/page/change_password.dart';
import 'package:ibank/feature/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:ibank/feature/forget_password/presentation/cubit/otp_cubit.dart';
import 'package:ibank/feature/forget_password/presentation/page/forget_password.dart';
import '../../../../core/constant/border/custom_border_radius.dart';
import '../../../../core/constant/color/custom_color.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/padding/custom_padding.dart';
import '../../../../core/constant/string/custom_string.dart';
import '../../../../core/widget/elevated_button/custom_elevated_button.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import '../cubit/forget_password_state.dart';

class ForgetPasswordOtpPage extends StatefulWidget {
  const ForgetPasswordOtpPage({super.key});

  @override
  State<ForgetPasswordOtpPage> createState() => _ForgetPasswordOtpPageState();
}

class _ForgetPasswordOtpPageState extends State<ForgetPasswordOtpPage> {
  final _formKey = GlobalKey<FormState>();
   
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => OtpCubit(),
  child: BlocBuilder<OtpCubit, ForgetPasswordState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
          children:[
            Gap(60),
            CustomAppBar(text: AppStrings.forget),
            Padding(
                padding: AppPadding.edgeAll20,
                child : Container(
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
                      Text(AppStrings.code,style: AppTextStyles.titleSmall,),
                      Gap(18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Form(
                              key:_formKey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: CustomFormField(
                                hintText: AppStrings.codeHint,
                                keyboardType: TextInputType.number,
                                onChanged: (val){
                                  context.read<OtpCubit>().otpVerification(val);
                                },
                                validator:(_)=>context.read<OtpCubit>().otpError,
                              ),
                            ),
                          ),
                          Gap(15),
                          Expanded(flex: 3,
                            child: CustomInkwellButton(
                                text: AppStrings.resend,
                                color: AppColors.buttonPrimary,
                                textStyle: AppTextStyles.buttonMedium,
                                height: MediaQuery.of(context).size.width*0.12,
                                width: MediaQuery.of(context).size.width*0.28,
                                onTap: (){}
                            ),
                          )
                        ],
                      ),
                      Gap(18),
                      RichText(
                        text: TextSpan(
                          style: AppTextStyles.h4,
                          children: [
                            TextSpan(text: AppStrings.mobileVerify,),
                            TextSpan(
                              text: AppStrings.number,
                              style: AppTextStyles.captionBold(color:AppColors.primary)
                              ),
                          ],
                        ),
                      ),
                      Gap(16),
                      Text(AppStrings.mobileDescription,
                        style:AppTextStyles.h4,),
                      Gap(28),
                      CustomElevatedButton(
                          text: AppStrings.changePassword,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          isEnabled: context.read<OtpCubit>().isOtpValid,
                          color1: AppColors.primarySurface,
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>ChangePassword())
                              );
                            }
                          }
                      ),
                    ],
                  ),
                )
            ),
            Gap(60),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>ForgetPassword())
                );
              },
                child: Text(AppStrings.changePhoneNumber,
                  style: AppTextStyles.captionBold(color: AppColors.primary),
                )
            )
          ]
      ),
    );
  },
),
);
  }
}
