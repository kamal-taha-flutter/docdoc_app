import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/style.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:docdoc_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:docdoc_app/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:docdoc_app/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:docdoc_app/features/signup/ui/widgets/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                Text('Create Account', style: TextStyles.font24BlueBold),
                verticalSpacing(10),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpacing(30),
                Column(
                  children: [
                    //Feilds
                    SignupFields(),

                    verticalSpacing(24),
                   
                    verticalSpacing(24),
                    AppTextButton(
                      buttonText: 'Sign Up',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(60),
                    const AlreadyHaveAccountText(),
                    SignupBlocListener()
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
    if(context.read<SignupCubit>().formKey.currentState!.validate()){
      context.read<SignupCubit>().emitSignup();
    }
  }
}
