// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converstion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionResponseImpl _$$ConversionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversionResponseImpl(
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$ConversionResponseImplToJson(
        _$ConversionResponseImpl instance) =>
    <String, dynamic>{
      'rates': instance.rates,
    };
