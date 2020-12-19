import 'package:bloc_food/state/food_list.dart';
import 'package:flutter/material.dart';

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List Screen '),
      ),
      body: FoodList(),
    );
  }
}
