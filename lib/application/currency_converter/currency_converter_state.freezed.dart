// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_converter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyConverterState {
  bool get isLoading => throw _privateConstructorUsedError;
  Currency get sourceCurrency => throw _privateConstructorUsedError;
  List<Currency> get targetCurrencies => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  ConversionResponse get ratesPerUnit => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyConverterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyConverterStateCopyWith<CurrencyConverterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConverterStateCopyWith<$Res> {
  factory $CurrencyConverterStateCopyWith(CurrencyConverterState value,
          $Res Function(CurrencyConverterState) then) =
      _$CurrencyConverterStateCopyWithImpl<$Res, CurrencyConverterState>;
  @useResult
  $Res call(
      {bool isLoading,
      Currency sourceCurrency,
      List<Currency> targetCurrencies,
      double amount,
      ConversionResponse ratesPerUnit});

  $ConversionResponseCopyWith<$Res> get ratesPerUnit;
}

/// @nodoc
class _$CurrencyConverterStateCopyWithImpl<$Res,
        $Val extends CurrencyConverterState>
    implements $CurrencyConverterStateCopyWith<$Res> {
  _$CurrencyConverterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyConverterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sourceCurrency = null,
    Object? targetCurrencies = null,
    Object? amount = null,
    Object? ratesPerUnit = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sourceCurrency: null == sourceCurrency
          ? _value.sourceCurrency
          : sourceCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      targetCurrencies: null == targetCurrencies
          ? _value.targetCurrencies
          : targetCurrencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      ratesPerUnit: null == ratesPerUnit
          ? _value.ratesPerUnit
          : ratesPerUnit // ignore: cast_nullable_to_non_nullable
              as ConversionResponse,
    ) as $Val);
  }

  /// Create a copy of CurrencyConverterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionResponseCopyWith<$Res> get ratesPerUnit {
    return $ConversionResponseCopyWith<$Res>(_value.ratesPerUnit, (value) {
      return _then(_value.copyWith(ratesPerUnit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyConverterStateImplCopyWith<$Res>
    implements $CurrencyConverterStateCopyWith<$Res> {
  factory _$$CurrencyConverterStateImplCopyWith(
          _$CurrencyConverterStateImpl value,
          $Res Function(_$CurrencyConverterStateImpl) then) =
      __$$CurrencyConverterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Currency sourceCurrency,
      List<Currency> targetCurrencies,
      double amount,
      ConversionResponse ratesPerUnit});

  @override
  $ConversionResponseCopyWith<$Res> get ratesPerUnit;
}

/// @nodoc
class __$$CurrencyConverterStateImplCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res,
        _$CurrencyConverterStateImpl>
    implements _$$CurrencyConverterStateImplCopyWith<$Res> {
  __$$CurrencyConverterStateImplCopyWithImpl(
      _$CurrencyConverterStateImpl _value,
      $Res Function(_$CurrencyConverterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyConverterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sourceCurrency = null,
    Object? targetCurrencies = null,
    Object? amount = null,
    Object? ratesPerUnit = null,
  }) {
    return _then(_$CurrencyConverterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sourceCurrency: null == sourceCurrency
          ? _value.sourceCurrency
          : sourceCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      targetCurrencies: null == targetCurrencies
          ? _value._targetCurrencies
          : targetCurrencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      ratesPerUnit: null == ratesPerUnit
          ? _value.ratesPerUnit
          : ratesPerUnit // ignore: cast_nullable_to_non_nullable
              as ConversionResponse,
    ));
  }
}

/// @nodoc

class _$CurrencyConverterStateImpl implements _CurrencyConverterState {
  const _$CurrencyConverterStateImpl(
      {required this.isLoading,
      required this.sourceCurrency,
      required final List<Currency> targetCurrencies,
      required this.amount,
      required this.ratesPerUnit})
      : _targetCurrencies = targetCurrencies;

  @override
  final bool isLoading;
  @override
  final Currency sourceCurrency;
  final List<Currency> _targetCurrencies;
  @override
  List<Currency> get targetCurrencies {
    if (_targetCurrencies is EqualUnmodifiableListView)
      return _targetCurrencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetCurrencies);
  }

  @override
  final double amount;
  @override
  final ConversionResponse ratesPerUnit;

  @override
  String toString() {
    return 'CurrencyConverterState(isLoading: $isLoading, sourceCurrency: $sourceCurrency, targetCurrencies: $targetCurrencies, amount: $amount, ratesPerUnit: $ratesPerUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyConverterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.sourceCurrency, sourceCurrency) ||
                other.sourceCurrency == sourceCurrency) &&
            const DeepCollectionEquality()
                .equals(other._targetCurrencies, _targetCurrencies) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.ratesPerUnit, ratesPerUnit) ||
                other.ratesPerUnit == ratesPerUnit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      sourceCurrency,
      const DeepCollectionEquality().hash(_targetCurrencies),
      amount,
      ratesPerUnit);

  /// Create a copy of CurrencyConverterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyConverterStateImplCopyWith<_$CurrencyConverterStateImpl>
      get copyWith => __$$CurrencyConverterStateImplCopyWithImpl<
          _$CurrencyConverterStateImpl>(this, _$identity);
}

abstract class _CurrencyConverterState implements CurrencyConverterState {
  const factory _CurrencyConverterState(
          {required final bool isLoading,
          required final Currency sourceCurrency,
          required final List<Currency> targetCurrencies,
          required final double amount,
          required final ConversionResponse ratesPerUnit}) =
      _$CurrencyConverterStateImpl;

  @override
  bool get isLoading;
  @override
  Currency get sourceCurrency;
  @override
  List<Currency> get targetCurrencies;
  @override
  double get amount;
  @override
  ConversionResponse get ratesPerUnit;

  /// Create a copy of CurrencyConverterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyConverterStateImplCopyWith<_$CurrencyConverterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
