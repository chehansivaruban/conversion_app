import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'converstion_response.freezed.dart';

part 'converstion_response.g.dart';

@freezed
class ConversionResponse with _$ConversionResponse {
  const factory ConversionResponse({
    required Map<String, double> rates,
  }) = _ConversionResponse;

  factory ConversionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversionResponseFromJson(json);
}
