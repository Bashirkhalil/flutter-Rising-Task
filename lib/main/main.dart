import 'package:currency/cubit/currency_cubit.dart';
import 'package:currency/utils/observer.dart';
import 'package:currency/view/cuurency_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reposteryApi/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.dioInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => CurrencyCubit(),
      child: buildMaterialApp());

  buildMaterialApp() => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: scaffoldHome(),
      );

  scaffoldHome() => Scaffold(
        appBar: AppBar(
          title: const Text("Currency Converter"),
        ),
        body: CurrencyScreen(),
      );

  /*
  Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
              ]),
        )
   */
}
