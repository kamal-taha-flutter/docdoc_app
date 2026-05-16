
import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/core/networking/api_service.dart';
import 'package:docdoc_app/features/signup/data/models/signup_body_request.dart';
import 'package:docdoc_app/features/signup/data/models/signup_response.dart';

class SignupRepo {
  ApiService apiService;
  SignupRepo({required this.apiService});

  Future<ApiResult<SignupResponse>> login(
    SignupBodyRequest signupBodyRequest,
  ) async {
    try {
      final Response = await apiService.signUp(signupBodyRequest);
      return ApiResult.success(Response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
