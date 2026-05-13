import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/core/networking/api_service.dart';
import 'package:docdoc_app/features/login/data/models/login_body_request.dart';
import 'package:docdoc_app/features/login/data/models/login_response.dart';

class LoginRepo {
  ApiService apiService;
  LoginRepo({required this.apiService});

  Future<ApiResult<LoginResponse>> login(
    LoginBodyRequest loginBodyRequest,
  ) async {
    try {
      final Response = await apiService.login(loginBodyRequest);
      return ApiResult.success(Response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
