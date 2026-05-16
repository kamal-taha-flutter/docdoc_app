import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/signup/data/models/signup_body_request.dart';
import 'package:docdoc_app/features/signup/data/repos/signup_repo.dart';
import 'package:docdoc_app/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void emitSignup() async {
    emit(SignupState.loading());
    final Response = await _signupRepo.login(
      SignupBodyRequest(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text, gender: 0,
      ),
    );
    Response.when(
      success: (SignupResponse) {
        emit(SignupState.success(SignupResponse));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
