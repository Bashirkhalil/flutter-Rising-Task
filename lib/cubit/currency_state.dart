part of 'currency_cubit.dart';

abstract class CurrencyState {}


class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyDataSuccess extends CurrencyState {}

class CurrencyError extends CurrencyState {
  String onError ;
  CurrencyError(this.onError);
}

