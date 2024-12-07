abstract class AppFailure extends AppError {
  const AppFailure({
    required super.message,
    required super.code,
  }) : super(stackTrace: StackTrace.empty);
}

abstract class AppException extends AppError implements Exception {
  const AppException({
    required super.message,
    required super.code,
    required super.stackTrace,
  });
}

sealed class AppError {
  final String message;
  final StackTrace stackTrace;
  final String code;

  const AppError({
    required this.message,
    required this.code,
    required this.stackTrace,
  });

  @override
  String toString() {
    return '${runtimeType.runtimeType}: $message\n' '$stackTrace';
  }
}
