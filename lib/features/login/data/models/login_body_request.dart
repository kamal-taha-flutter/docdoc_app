import 'package:json_annotation/json_annotation.dart';
part 'login_body_request.g.dart';

@JsonSerializable()
class LoginBodyRequest {
  final String email;
  final String password;

  LoginBodyRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginBodyRequestToJson(this);
}
