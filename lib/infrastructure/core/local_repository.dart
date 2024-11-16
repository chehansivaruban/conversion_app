import 'dart:convert';
import 'package:currency_picker/currency_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/failure.dart';
import '../../domain/core/i_local_repository.dart';
import '../../domain/core/storage_failure.dart';
import '../../domain/core/values/constants.dart';
import '../../utils/log_utils.dart';

class LocalRepository extends ILocalRepository {
  LocalRepository(this.storage, this._prefs);

  final FlutterSecureStorage storage;
  final SharedPreferences _prefs;
  static const String _targetCurrenciesKey = 'target_currencies';

  static final _logUtils = LogUtils(
    featureName: "LocalRepository",
    printLog: false,
  );

  @override
  Future<List<Currency>> getTargetCurrencies() async {
    final String? currenciesJson = _prefs.getString(_targetCurrenciesKey);
    if (currenciesJson == null) return [];

    final List<dynamic> currenciesList = json.decode(currenciesJson);
    return currenciesList.map((currencyMap) {
      return Currency.from(json: currencyMap);
    }).toList();
  }

  @override
  Future<void> saveTargetCurrencies(List<Currency> currencies) async {
    final List<Map<String, dynamic>> currenciesList =
        currencies.map((currency) => currency.toJson()).toList();
    await _prefs.setString(_targetCurrenciesKey, json.encode(currenciesList));
  }

  @override
  Future<Either<Failure, Unit>> create(String key, String value) async {
    _logUtils.log("create :: key : $key :: value : $value");

    if (!await storage.containsKey(key: key)) {
      await storage.write(key: key, value: value);
      return right(unit);
    } else {
      return left(const Failure.storage(StorageFailure.unableToCreate()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createOrUpdate(String key, String value) async {
    _logUtils.log("createOrUpdate :: key : $key :: value : $value");

    await storage.write(key: key, value: value);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> delete(String key) async {
    _logUtils.log("delete :: key : $key");

    if (await storage.containsKey(key: key)) {
      await storage.delete(key: key);
      return right(unit);
    } else {
      return left(const Failure.storage(StorageFailure.unableToDelete()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAll() async {
    _logUtils.log("deleteAll");

    await storage.deleteAll();
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteLogin() async {
    final deleteKeys = [
      StorageKeys.isLoggedIn,
      StorageKeys.token,
      StorageKeys.email,
    ];

    Either<Failure, Unit>? failureOrSuccess;

    for (final key in deleteKeys) {
      failureOrSuccess = await delete(key);
    }

    return failureOrSuccess ?? right(unit);
  }

  @override
  Future<Either<Failure, String>> read(String key) async {
    _logUtils.log("read :: key : $key");

    if (await storage.containsKey(key: key)) {
      final value = await storage.read(key: key);
      _logUtils.log("read :: key : $key :: value : $value");

      return right(value ?? '');
    } else {
      return left(const Failure.storage(StorageFailure.notFound()));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>>> readAll() async {
    _logUtils.log("readAll");

    return right(await storage.readAll());
  }

  @override
  Future<Either<Failure, Unit>> update(String key, String value) async {
    _logUtils.log("update :: key : $key :: value : $value");

    if (await storage.containsKey(key: key)) {
      await storage.write(key: key, value: value);
      return right(unit);
    } else {
      return left(const Failure.storage(StorageFailure.unableToUpdate()));
    }
  }
}
