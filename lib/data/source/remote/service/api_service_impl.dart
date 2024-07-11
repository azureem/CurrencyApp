import 'package:currency_flutter/data/source/remote/response/currency_reponse.dart';
import 'package:currency_flutter/data/source/remote/service/api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl extends ApiService {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://cbu.uz/uz/',
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    contentType: 'application/json',
  ));

  @override
  Future<List<CurrencyModel>> getCurrency() async {
    try {
      final response = await dio.get('arkhiv-kursov-valyut/json');
      return (response.data as List)
          .map((comingValue) => CurrencyModel.fromJson(comingValue))
          .toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getCurrencyByDate(String date)async {
   try{
     final response = await dio.get('arkhiv-kursov-valyut/json/all/$date/ ');
     return (response.data as List)
         .map((comingValue)=>CurrencyModel.fromJson(comingValue))
         .toList();
   }on DioException{
     rethrow;
   }
  }
}
