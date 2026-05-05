import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/colors.dart';
import 'package:docdoc_app/core/theme/style.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/core/widgets/app_text_form_field.dart';
import 'package:docdoc_app/features/login/ui/widgets/already_have_account_text.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpacing(15),
                      AppTextFormField(
                        hintText: 'Password',
                        isObsecureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: isObsecureText
                              ? Icon(
                                  Icons.visibility_off,
                                  color: ColorsManger.primary,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: ColorsManger.primary,
                                ),
                        ),
                      ),
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
                        onPressed: () {},
                      ),
                      verticalSpacing(16),
                      const TermsAndConditionsText(),
                      verticalSpacing(60),
                      const AlreadyHaveAccountText()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
