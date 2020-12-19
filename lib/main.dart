import 'package:bloc_food/bloc/food_bloc.dart';
import 'package:bloc_food/bloc/food_bloc_delegate.dart';
import 'package:bloc_food/state/food_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = FoodBlocDelegate();

  runApp(
    BlocProvider<FoodBloc> (
      create: (context) => FoodBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodForm(),
      ),
    )
  );
}

