part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}
class GetCurrencyEvent extends MainEvent{}
class GetCurrencyEventByDate extends MainEvent{
  String date;
  GetCurrencyEventByDate({required this.date});
}
