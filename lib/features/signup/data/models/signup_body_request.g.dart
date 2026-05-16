// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupBodyRequest _$SignupBodyRequestFromJson(Map<String, dynamic> json) =>
    SignupBodyRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$SignupBodyRequestToJson(SignupBodyRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
    };
