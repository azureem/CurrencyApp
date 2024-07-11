import 'package:currency_flutter/data/source/remote/response/currency_reponse.dart';

abstract class ApiService {
  Future<List<CurrencyModel>> getCurrency();
  Future<List<CurrencyModel>> getCurrencyByDate(String date);
}
