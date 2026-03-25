import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:ibank/core/constant/border/custom_border_radius.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/font_size/custom_text_style.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import 'package:ibank/core/constant/string/custom_string.dart';
import 'package:ibank/core/validation/mobile_number_validation/mobile_number_validation.dart';
import 'package:ibank/core/widget/custom_app_bar/custom_app_bar.dart';
import 'package:ibank/core/widget/elevated_button/custom_elevated_button.dart';
import 'package:ibank/core/widget/text_form_field/custom_text_form_field.dart';
import 'package:ibank/feature/auth/presentation/cubit/auth_state.dart';
import 'package:ibank/feature/auth/presentation/cubit/signup_cubit.dart';
import 'package:ibank/feature/auth/presentation/page/login_page.dart';
import 'package:ibank/feature/auth/presentation/widget/app_navigation_bar.dart';
import '../../../../core/image/app_image.dart';
import '../../../../core/utils/image_picker/custom_image_picker.dart';
import '../../../../core/validation/password_validation/password_validation.dart';
import '../../../../core/widget/snack_bar/custom_snack_bar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  File? selectedImage;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController=TextEditingController();
  final TextEditingController nameEditingController=TextEditingController();
  final TextEditingController passwordEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => GetIt.I<SignupCubit>(),
  child: Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        title: CustomAppBar(
        text: AppStrings.signUp,
        textStyle: AppTextStyles.h3Bold,
        color: AppColors.primaryContainer,
      ),),
      body: BlocConsumer<SignupCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          CustomSnacksBar.showSuccess(context, AppStrings.signSuccess);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
        } else if (state is AuthFailure) {
          CustomSnacksBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Container(
            color: AppColors.primary,
            child: Container(
              padding: AppPadding.edgeAll20,
              height: MediaQuery.sizeOf(context).height * 0.88,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: CustomBorderRadius.onlyTop28,
              ),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.welcome, style: AppTextStyles.h2),
                      Text(AppStrings.creteAccount, style: AppTextStyles.caption()),
                      Gap(25),
                      Align(
                          child: CustomImagePicker(
                            width: 140,
                            height: 140,
                            radius: 80,
                          )
                      ),
                      Gap(30),
                      CustomFormField(
                        hintText: AppStrings.nameHint,
                        controller: nameEditingController,
                        onChanged: (val){
                          context.read<SignupCubit>().nameValidation(val);
                        },
                        validator: (_)=>context.read<SignupCubit>().nameError,
                      ),
                      Gap(25),
                      CustomFormField(
                        hintText: AppStrings.textInput,
                        controller: textEditingController,
                        onChanged:(val){
                          context.read<SignupCubit>().mobileNumberValidation(val);
                        },
                        validator: (_)=>context.read<SignupCubit>().mobileError,
                        keyboardType: TextInputType.number,
                      ),
                      Gap(25),
                      CustomFormField(
                        hintText: AppStrings.passwordHint,
                        controller: passwordEditingController,
                        onChanged: (val){
                          context.read<SignupCubit>().passwordValidation(val);
                        },
                        validator: (_)=>context.read<SignupCubit>().passwordError,
                      ),
                      Gap(18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<SignupCubit>().toggleCheckbox();
                            },
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.read<SignupCubit>().isChecked ? AppColors.primary : Colors.grey,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                color: context.read<SignupCubit>().isChecked ? AppColors.surface : Colors.transparent,
                              ),
                              child: context.read<SignupCubit>().isChecked
                                  ? Icon(
                                Icons.check,
                                size: 24,
                                weight: 16,
                                color: AppColors.primary,
                              )
                                  : null,
                            ),
                          ),
                          Gap(10),
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.bodySmall.copyWith(letterSpacing: 1),
                              children: [
                                TextSpan(text: AppStrings.termConditionText,),
                                TextSpan(
                                  text: AppStrings.termCondition,
                                  style: AppTextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.bold,letterSpacing:1,color: AppColors.primary
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(40),
                      CustomElevatedButton(
                        text: AppStrings.signUp,
                        isLoading: state is AuthLoading,
                        isEnabled:context.read<SignupCubit>().isFormValid,
                        onPressed: ()async {
                          if (_formKey.currentState!.validate()) {
                            await context.read<SignupCubit>().signUp(
                                nameEditingController.text,
                                textEditingController.text,
                                passwordEditingController.text
                            );
                          }
                        },
                      ),
                      Gap(60),
                      AppNavigationBar(
                          text1: AppStrings.haveAnAccount,
                          text2: AppStrings.signIn,
                          onTap: () =>Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>LoginPage())
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      ),
    ),
);
  }
}