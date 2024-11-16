import 'package:currency_converter/infrastructure/core/providers.dart';
import 'package:currency_converter/infrastructure/currency_converter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'currency_converter_state.dart';
import 'currency_converter_state_notifier.dart';

final currencyConverterStateProvider = StateNotifierProvider<
    CurrencyConverterStateNotifier, CurrencyConverterState>(
  (ref) => CurrencyConverterStateNotifier(
    ref.read(currencyConverterRepositoryProvider),
    ref.read(localRepositoryProvider),
  ),
);
