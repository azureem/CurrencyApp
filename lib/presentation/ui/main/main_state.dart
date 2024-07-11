part of 'main_bloc.dart';

@immutable
class MainState {
  final Status? status;
  final String? errorMsg;
  final List<CurrencyModel>? list;

  MainState({this.status, this.errorMsg, this.list});




  MainState copyWith(
      {Status? status, String? errorMSg, List<CurrencyModel>? list}) {
    return MainState(
        status: status ?? this.status,
        errorMsg: errorMSg ?? this.errorMsg,
        list: list ?? this.list);
  }
}
