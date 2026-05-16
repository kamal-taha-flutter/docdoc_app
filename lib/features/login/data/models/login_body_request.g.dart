// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBodyRequest _$LoginBodyRequestFromJson(Map<String, dynamic> json) =>
    LoginBodyRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginBodyRequestToJson(LoginBodyRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
