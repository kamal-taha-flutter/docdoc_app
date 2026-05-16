import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/login/data/models/login_body_request.dart';
import 'package:docdoc_app/features/login/data/repos/login_repo.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLogin() async {
    emit(LoginState.loading());
    final Response = await _loginRepo.login(LoginBodyRequest(email: emailController.text,password: passwordController.text));
    Response.when(
      success: (LoginResponse) {
        emit(LoginState.success(LoginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
