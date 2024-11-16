import 'package:currency_converter/domain/currency_converter/converstion_response.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_converter_state.freezed.dart';

@freezed
class CurrencyConverterState with _$CurrencyConverterState {
  const factory CurrencyConverterState({
    required bool isLoading,
    required Currency sourceCurrency,
    required List<Currency> targetCurrencies,
    required double amount,
    required ConversionResponse ratesPerUnit,
  }) = _CurrencyConverterState;

  factory CurrencyConverterState.initial() => CurrencyConverterState(
        isLoading: false,
        sourceCurrency: Currency(
          code: 'USD',
          name: 'United States Dollar',
          symbol: '\$',
          flag: '🇺🇸',
          number: 1,
          decimalDigits: 2,
          namePlural: 'United States Dollars',
          symbolOnLeft: true,
          decimalSeparator: '.',
          thousandsSeparator: ',',
          spaceBetweenAmountAndSymbol: true,
        ),
        targetCurrencies: [],
        amount: 0,
        ratesPerUnit: const ConversionResponse(rates: {}),
      );
}
