import 'package:bloc/bloc.dart';
import 'package:currency_flutter/data/source/remote/service/api_service_impl.dart';
import 'package:currency_flutter/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/source/remote/response/currency_reponse.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<MainEvent>((event, emit)  {


    });
    on<GetCurrencyEvent>((event, emit)async {
      final repo = ApiServiceImpl();
      try {
        emit(state.copyWith(status: Status.loading));
        final list = await repo.getCurrency();
        emit(state.copyWith(status: Status.success, list: list));
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.fail, errorMSg: e.message));
      }

    });
    
    on<GetCurrencyEventByDate>((event, emit)async{
      final repo = ApiServiceImpl();
      try {
        emit(state.copyWith(status: Status.loading));
        final list = await repo.getCurrencyByDate(event.date);
        emit(state.copyWith(status: Status.success, list: list));
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.fail, errorMSg: e.message));
      }
    });
  }
}
