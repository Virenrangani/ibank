import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/widget/custom_app_bar/custom_app_bar.dart';
import 'package:ibank/core/widget/elevated_button/custom_elevated_button.dart';
import 'package:ibank/core/widget/inkwell_button/custom_inkwell_button.dart';
import 'package:ibank/feature/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:ibank/feature/change_password/presentation/cubit/change_password_state.dart';
import 'package:ibank/feature/change_password/presentation/page/change_password_success.dart';
import '../../../../core/constant/border/custom_border_radius.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/padding/custom_padding.dart';
import '../../../../core/constant/string/custom_string.dart';
import '../../../../core/image/app_image.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey=GlobalKey<FormState>();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ChangePasswordCubit(),
  child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
        body:Column(
            children:[
              Gap(60),
              CustomAppBar(text: AppStrings.changePassword),
              Padding(
                  padding: AppPadding.edgeAll24,
                  child : Container(
                    padding: AppPadding.edgeAll16,
                    decoration: BoxDecoration(
                      borderRadius: CustomBorderRadius.cir20,
                      color: AppColors.background,
                      boxShadow: [BoxShadow(
                        color: AppColors.border,
                        blurRadius: 4,
                      )]
                    ),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.passChange,style: AppTextStyles.titleSmall,),
                          Gap(10),
                          CustomFormField(
                            controller: newPasswordController,
                            obscureText: true,
                            suffix: Image.asset(AppImage.eye,
                              height: 20,width: 20,),
                            onChanged: (val)=>context.read<ChangePasswordCubit>().passwordValidation(val),
                            validator: (_)=>context.read<ChangePasswordCubit>().passwordError,
                          ),
                          Gap(20),
                          Text(AppStrings.confirmPass,style:AppTextStyles.titleSmall,),
                          Gap(10),
                          CustomFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            suffix: Image.asset(AppImage.eye,
                            height:20,width: 20,),
                            validator: (val){
                              if(val!=newPasswordController.text){
                                return "Not Matched";
                              }
                              return null;
                            },
                          ),
                          Gap(70),
                          CustomElevatedButton(
                              text: AppStrings.changePassword,
                              isEnabled: context.read<ChangePasswordCubit>().isFormValid,
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context)=>ChangePasswordSuccess())
                                  );
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  )
              )
            ]
        )
    );
  },
),
);
  }
}
