import 'package:currency/cubit/currency_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyScreen extends StatelessWidget {
  CurrencyScreen({super.key});

  var valueA = TextEditingController();
  var valueB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) {},
      builder: (context, state) {
        CurrencyCubit cubit = CurrencyCubit.getInitCubit(context);

        if (state is CurrencyLoading) {
        } else if (state is CurrencyDataSuccess) {
        } else if (state is CurrencyError) {
        } else {
          cubit.getCatData(currencyName: "USD");
        }

        return Center(
          child: Container(
            color: Colors.yellow,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildUpperCurrencyRow(context, cubit),
                buildUpperCurrencyRowConverter(context, cubit)
              ],
            ),
          ),
        );
        // return  cubit.currencyNameList.isEmpty ? const Center(child: Text("Empty") ) : buildDrop(context);
      },
    );
  }

  // Upper Row
  buildUpperCurrencyRow(context, cubit) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: TextFormField(
              controller: valueA,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter number',
                filled: true,
                fillColor: Colors.grey[100],
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
                // Ad
                isDense: true,
                // Added this// ded this
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey, width: 0.2),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          cubit.currencyNameList.isEmpty
              ? const Center(child: Text("Loading"))
              : buildDrop(context)
        ],
      );

  Widget buildDrop(context) => DropdownButton<String>(
        value: CurrencyCubit.getInitCubit(context).currencyNameList.first,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          print("Selected Value is ${value}");
          // if (value != null) {
            CurrencyCubit.getInitCubit(context).getCurrentCurrencyValue(value!);
          // } else {
          //   print('Values is Null ');
          // }
        },
        items: CurrencyCubit.getInitCubit(context)
            .currencyNameList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

  // Lower Row
  buildUpperCurrencyRowConverter(context, cubit) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: TextFormField(
              controller: valueB,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter number',
                filled: true,
                fillColor: Colors.grey[100],
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
                // Ad
                isDense: true,
                // Added this// ded this
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey, width: 0.2),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          cubit.currencyNameDownList.isEmpty
              ? const Center(child: Text("Loading"))
              : buildDownDrop(context)
        ],
      );

  Widget buildDownDrop(context) => DropdownButton<String>(
        value: CurrencyCubit.getInitCubit(context).currencyNameDownList.first,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          print("Selected Value is ${value}");
          // CurrencyCubit.getInitCubit(context).getCurrentCurrencyValue(value!);
        },
        items: CurrencyCubit.getInitCubit(context)
            .currencyNameDownList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
}
