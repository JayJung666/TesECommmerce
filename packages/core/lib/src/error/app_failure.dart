import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const factory AppFailure.network({
    required String message,
    String? code,
  }) = NetworkFailure;

  const factory AppFailure.server({
    required String message,
    required int statusCode,
    String? code,
  }) = ServerFailure;

  const factory AppFailure.cache({
    required String message,
  }) = CacheFailure;

  const factory AppFailure.authentication({
    required String message,
    String? code,
  }) = AuthenticationFailure;

  const factory AppFailure.authorization({
    required String message,
  }) = AuthorizationFailure;

  const factory AppFailure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;

  const factory AppFailure.notFound({
    required String message,
  }) = NotFoundFailure;

  const factory AppFailure.timeout({
    required String message,
  }) = TimeoutFailure;

  const factory AppFailure.unknown({
    required String message,
    Object? exception,
  }) = UnknownFailure;
}

extension AppFailureExtension on AppFailure {
  String get displayMessage {
    return when(
      network: (message, _) => 'Network error: $message',
      server: (message, statusCode, _) => 'Server error ($statusCode): $message',
      cache: (message) => 'Cache error: $message',
      authentication: (message, _) => 'Authentication error: $message',
      authorization: (message) => 'Authorization error: $message',
      validation: (message, _) => 'Validation error: $message',
      notFound: (message) => 'Not found: $message',
      timeout: (message) => 'Timeout: $message',
      unknown: (message, _) => 'Unknown error: $message',
    );
  }
}