import 'package:currency_converter/config.dart';
import 'package:currency_converter/domain/core/failure.dart';
import 'package:currency_converter/infrastructure/core/api_helper.dart';
import 'package:dartz/dartz.dart';

import '../../domain/core/core_failure.dart';
import '../../domain/currency_converter/converstion_response.dart';
import '../../domain/currency_converter/i_currency_converter_repository.dart';
import '../../utils/log_utils.dart';

class CurrencyConverterRepository implements ICurrencyConverterRepository {
  CurrencyConverterRepository(this._apiHelper);

  final ApiHelper _apiHelper;

  static final _logUtils = LogUtils(
    featureName: 'CurrencyConverterRepository',
    printLog: true,
  );

  @override
  Future<Either<Failure, ConversionResponse>> convertCurrency(
      String baseCurrency) async {
    try{
      var res = await _apiHelper.request(
        HttpMethod.get,
        'https://api.fxfeed.io/v1/latest?base=$baseCurrency&api_key=fxf_pTqGipeBUC7nWaEUsnH1',
        addDefaultParams: false,
        isExternal: true,
      );
      final conversionResponse = ConversionResponse.fromJson(res.data);
      _logUtils.log('conversionResponse :: $conversionResponse');
      return right(conversionResponse);
    } catch (e) {
      _logUtils.log('error :: $e');
      return left(
        const Failure.core(
          CoreFailure.serverError(""),
        ),
      );
    }
  }
}
