import 'package:json_annotation/json_annotation.dart';
part 'signup_body_request.g.dart';

@JsonSerializable()
class SignupBodyRequest {
  final String name;
  final String email;
  final String phone;
  final int gender ;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;



  SignupBodyRequest({ required this.name, required this.email, required this.phone, required this.password, required this.confirmPassword, required this.gender});

  Map<String, dynamic> toJson() => _$SignupBodyRequestToJson(this);
}
