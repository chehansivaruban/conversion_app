import 'package:currency_converter/domain/core/failure.dart';
import 'package:dartz/dartz.dart';

import 'converstion_response.dart';

abstract class ICurrencyConverterRepository {
  Future<Either<Failure, ConversionResponse>> convertCurrency(
      String baseCurrency);
}
