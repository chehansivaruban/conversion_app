import 'package:currency_converter/domain/core/i_local_repository.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/currency_converter/i_currency_converter_repository.dart';
import '../../utils/log_utils.dart';
import 'currency_converter_state.dart';

class CurrencyConverterStateNotifier
    extends StateNotifier<CurrencyConverterState> {
  CurrencyConverterStateNotifier(
      this._currencyConverterRepository, this._localRepository)
      : super(CurrencyConverterState.initial()) {
    _logUtils.log("init");
    _loadTargetCurrencies();
  }

  final ICurrencyConverterRepository _currencyConverterRepository;
  final ILocalRepository _localRepository;

  static final LogUtils _logUtils = LogUtils(
    featureName: "CurrencyConverterStateNotifier",
    printLog: true,
  );

  Future<void> _loadTargetCurrencies() async {
    final savedCurrencies = await _localRepository.getTargetCurrencies();
    if (savedCurrencies.isNotEmpty) {
      state = state.copyWith(targetCurrencies: savedCurrencies);
    }
    getRatesPerUnit();
  }

  Future<void> convertCurrency() async {
    state = state.copyWith(isLoading: true);
    final res = await _currencyConverterRepository.convertCurrency("sd");
    res.fold(
      (l) => state = state.copyWith(isLoading: false),
      (r) => state = state.copyWith(isLoading: false),
    );
  }

  Future<void> getRatesPerUnit() async {
    final sourceCurrency = state.sourceCurrency;
    final res =
        await _currencyConverterRepository.convertCurrency(sourceCurrency.code);
    res.fold(
      (l) => state = state.copyWith(isLoading: false),
      (r) => state = state.copyWith(ratesPerUnit: r),
    );
  }

  Future<void> setSourceCurrency(Currency currency) async {
    _logUtils.log("currency: ${currency.code}");
    state = state.copyWith(sourceCurrency: currency);
    await getRatesPerUnit();
  }

  Future<void> setAmount(String amount) async {
    if (amount.isEmpty) {
      state = state.copyWith(amount: 0);
      return;
    }
    _logUtils.log("amount: $amount");
    final double amountDouble = double.parse(amount);
    state = state.copyWith(amount: amountDouble);
  }

  void addTargetCurrency(Currency currency) {
    state = state.copyWith(
      targetCurrencies: [...state.targetCurrencies, currency],
    );
    _localRepository.saveTargetCurrencies(state.targetCurrencies);
    _logUtils.log("targetCurrencies: ${state.targetCurrencies.length}");
  }

  void removeTargetCurrency(Currency country) {
    final updatedCurrencies =
        state.targetCurrencies.where((c) => c.code != country.code).toList();
    state = state.copyWith(targetCurrencies: updatedCurrencies);
    _localRepository.saveTargetCurrencies(updatedCurrencies);
    _logUtils.log("targetCurrencies: ${state.targetCurrencies.length}");
  }
}
