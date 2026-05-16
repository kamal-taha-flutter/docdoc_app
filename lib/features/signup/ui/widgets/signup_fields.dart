import 'package:docdoc_app/core/helpers/app_regex.dart';
import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/colors.dart';
import 'package:docdoc_app/core/widgets/app_text_form_field.dart';
import 'package:docdoc_app/features/login/ui/widgets/password_validations.dart';
import 'package:docdoc_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupFields extends StatefulWidget {
  const SignupFields({super.key});

  @override
  State<SignupFields> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<SignupFields> {
  bool isObsecureText = true;
  bool isObsecureConfirmText = true;


  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    return passwordController.addListener((){
    setState(() {
      hasLowercase =AppRegex.hasLowerCase(passwordController.text);
      hasUppercase =AppRegex.hasUpperCase(passwordController.text);
      hasSpecialCharacters =AppRegex.hasSpecialCharacter(passwordController.text);
      hasNumber =AppRegex.hasNumber(passwordController.text);
      hasMinLength =AppRegex.hasMinLength(passwordController.text);
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:context.read<SignupCubit>().formKey ,
      child: Column(
        children: [
          //name
           AppTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return 'Please enter a valid name';
              }
            },
          ),
          verticalSpacing(15),
          //email
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpacing(15),
          //phone
          AppTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: 'Phone Number',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEgyptianPhoneNumberValid(value)) {
                return 'Please enter a valid PhoneNumber';
              }
            },
          ),
          verticalSpacing(15),
          //password
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObsecureText: isObsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecureText = !isObsecureText;
                });
              },
              child: isObsecureText
                  ? Icon(Icons.visibility_off, color: ColorsManger.primary)
                  : Icon(Icons.visibility, color: ColorsManger.primary),
            ),
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpacing(15),
          //confirm password
          AppTextFormField(
            controller: context.read<SignupCubit>().confirmPasswordController,
            hintText: 'Confirm Password',
            isObsecureText: isObsecureConfirmText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecureConfirmText = !isObsecureConfirmText;
                });
              },
              child: isObsecureConfirmText
                  ? Icon(Icons.visibility_off, color: ColorsManger.primary)
                  : Icon(Icons.visibility, color: ColorsManger.primary),
            ),
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return 'Please enter a valid email';
              }
            },
          ),
           verticalSpacing(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpacing(24),
        ],
      ),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

