import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/providers.dart';
import 'currentcy_converter_repository.dart';

final currencyConverterRepositoryProvider =
    Provider<CurrencyConverterRepository>((ref) {
  final apiHelper = ref.watch(apiHelperProvider);
  return CurrencyConverterRepository(apiHelper);
});
