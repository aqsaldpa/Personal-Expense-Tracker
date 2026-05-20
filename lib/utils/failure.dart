import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const factory AppFailure(String message) = _AppFailure;
}
