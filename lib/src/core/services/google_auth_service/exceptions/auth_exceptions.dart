import '../../../errors/app_error.dart';

class GetCurrentUserAuthException extends AppException {
  const GetCurrentUserAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'get_current_user_auth');
}

class SignOutAuthException extends AppException {
  const SignOutAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'sign_out_auth');
}

class SignInAuthException extends AppException {
  const SignInAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'sign_in_auth');
}
