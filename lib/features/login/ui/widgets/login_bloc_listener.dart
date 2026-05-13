import 'package:docdoc_app/core/helpers/extentions.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/core/theme/colors.dart';
import 'package:docdoc_app/core/theme/style.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManger.primary),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ), // Icon
                content: Text(
                  error,
                  style: TextStyles.font15DarkBlueMedium,
                ), // Text
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Got it',
                      style: TextStyles.font14BlueSemiBold,
                    ), // Text
                  ), // TextButton
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
