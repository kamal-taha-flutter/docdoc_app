

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState<T> with _$SignupState<T> {
   factory SignupState.initial() = _Initial;
   factory SignupState.loading() = Loading;
   factory SignupState.success(T data) = Success<T>;
   factory SignupState.error({required String error}) = Error;

}