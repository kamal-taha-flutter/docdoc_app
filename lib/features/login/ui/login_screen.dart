import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/style.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/features/login/data/models/login_body_request.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_app/features/login/ui/widgets/already_have_account_text.dart';
import 'package:docdoc_app/features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpacing(10),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpacing(30),
                Column(
                  children: [
                    EmailAndPassword(),
                    verticalSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forget Password ?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpacing(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(60),
                    const AlreadyHaveAccountText(),
                    LoginBlocListener()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emitLogin(
        LoginBodyRequest(
          email: context.read<LoginCubit>().emailController.text, 
          password: context.read<LoginCubit>().passwordController.text)
      );
    }
  }
}
