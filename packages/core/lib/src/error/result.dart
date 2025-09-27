import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppFailure failure) = Failure<T>;
}

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => when(
        success: (data) => data,
        failure: (_) => null,
      );

  AppFailure? get failure => when(
        success: (_) => null,
        failure: (failure) => failure,
      );

  T getOrThrow() => when(
        success: (data) => data,
        failure: (failure) => throw Exception(failure.displayMessage),
      );

  T getOrElse(T defaultValue) => when(
        success: (data) => data,
        failure: (_) => defaultValue,
      );

  Result<U> map<U>(U Function(T) mapper) => when(
        success: (data) => Result.success(mapper(data)),
        failure: (failure) => Result.failure(failure),
      );

  Result<U> flatMap<U>(Result<U> Function(T) mapper) => when(
        success: (data) => mapper(data),
        failure: (failure) => Result.failure(failure),
      );
}