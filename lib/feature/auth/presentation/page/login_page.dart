import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:ibank/core/constant/border/custom_border_radius.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/image/app_image.dart';
import 'package:ibank/core/widget/custom_app_bar/custom_app_bar.dart';
import 'package:ibank/core/widget/elevated_button/custom_elevated_button.dart';
import 'package:ibank/feature/auth/presentation/cubit/auth_state.dart';
import 'package:ibank/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:ibank/feature/auth/presentation/page/signup_page.dart';
import 'package:ibank/feature/auth/presentation/widget/app_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/padding/custom_padding.dart';
import '../../../../core/constant/string/custom_string.dart';
import '../../../../core/validation/mobile_number_validation/mobile_number_validation.dart';
import '../../../../core/validation/password_validation/password_validation.dart';
import '../../../../core/widget/snack_bar/custom_snack_bar.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import 'package:ibank/feature/forget_password/presentation/page/forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingController=TextEditingController();
  final TextEditingController passwordEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => GetIt.I<LoginCubit>(),
  child: BlocConsumer<LoginCubit, AuthState>(
  listener: (context, state) {
    if (state is AuthSuccess) {
      CustomSnacksBar.showSuccess(context, AppStrings.loginSuccess);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    } else if (state is AuthFailure) {
      CustomSnacksBar.showError(context, state.message);
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(
                text: AppStrings.signIn,
                textStyle: AppTextStyles.h3,
                color: AppColors.primaryContainer,
                hasBackButton: false,
              ),
              Flexible(
                child: Container(
                  padding: AppPadding.edgeAll20,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: CustomBorderRadius.onlyTop28
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(AppStrings.logInIntro, style: AppTextStyles.h2),
                            Text(AppStrings.logInDescription, style: AppTextStyles.caption()),
                            Gap(25),
                            Align(
                              child: Image.asset(
                                AppImage.loginImage,
                                width: 250,
                                height: 250,
                              ),
                            ),
                            Gap(12),
                            CustomFormField(
                              hintText: AppStrings.textInput,
                              controller: textEditingController,
                              onChanged:(val) {
                                context.read<LoginCubit>().mobileNumberValidation(val);
                              },
                              validator: (_)=>context.read<LoginCubit>().mobileNumberError,
                              keyboardType: TextInputType.number,
                            ),
                            Gap(25),
                            CustomFormField(
                              hintText: AppStrings.passwordHint,
                              controller: passwordEditingController,
                              onChanged: (val){
                                context.read<LoginCubit>().passwordValidation(val);
                              },
                              validator: (_) => context.read<LoginCubit>().passwordError,
                              obscureText: true,
                              suffix: Image.asset(AppImage.eye,height:18,width:18,),
                            ),
                            Gap(15),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>ForgetPassword())
                                  );
                                },
                                child: Text(AppStrings.forgetPassword,
                                  style:AppTextStyles.caption(color:AppColors.textLight),),
                              ),
                            ),
                            Gap(35),
                            CustomElevatedButton(
                                text: AppStrings.signIn,
                                isEnabled:context.read<LoginCubit>().isFormValid,
                                onPressed: ()async{
                                  await context.read<LoginCubit>().logIn(
                                      textEditingController.text,
                                      passwordEditingController.text
                                  );
                                }
                            ),
                            Gap(30),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  height: 72,
                                  width: 72,
                                  child: Image.asset(AppImage.fingerPrint,scale: 1,fit: BoxFit.cover,)),
                            ),
                            Gap(30),
                            AppNavigationBar(
                                text1: AppStrings.doNotHaveAccount,
                                text2: AppStrings.signUp,
                                onTap: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>SignupPage())),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  },
),
);
  }
}
