import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/features/login/data/models/login_body_request.dart';
import 'package:docdoc_app/features/login/data/models/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginBodyRequest loginBodyRequest);
}
