import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../reposteryApi/dio_helper.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial());

  static CurrencyCubit getInitCubit(context) => BlocProvider.of<CurrencyCubit>(context);

   List<String> currencyNameList = [] ;
   List<String> currencyNameDownList = [] ;
   List<dynamic> currencyNameDownListValue = [] ;

  void getCatData({required String currencyName}) {
    emit(CurrencyLoading());

    DioHelper.getCurrencyFromApi(url: 'v6/latest/${currencyName}').then((value) {
      // List ab = json.decode(value.data).cast<Catogery>().toList();

       var jsonMap = json.decode(value.toString());
       var rates = jsonMap['rates'];
       // print('Result is =>  ${rates} ');

        rates.keys.forEach((key) {
         // print(key);
          currencyNameList.add(key);
       });
      // cats = jsonMap;
      emit(CurrencyDataSuccess());
    }).catchError((onError) {
      print('Error is $onError ');
      emit(CurrencyError(onError));
    });
  }

  void getCurrentCurrencyValue(String currentCurrency) {
    DioHelper.getCurrencyFromApi(url: 'v6/latest/$currentCurrency').then((value) {
      // List ab = json.decode(value.data).cast<Catogery>().toList();
      var jsonMap = json.decode(value.toString());
      var rates = jsonMap['rates'];
      print('Result is =>  ${rates} ');

      currencyNameDownList.clear();
      rates.keys.forEach((key) {
        // print(key);
        currencyNameDownList.add(key);
      });

      currencyNameDownListValue.clear();
      rates.values.forEach((value) {
        // dynamic cz = value ;
        // var long2 = double.parse(value);
        currencyNameDownListValue.add(value);
      });


      emit(CurrencyDataSuccess());
    }).catchError((onError) {
      print('Error is $onError ');
      // emit(CurrencyError(onError));
    });
  }

}
