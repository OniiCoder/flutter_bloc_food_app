import 'package:bloc_food/bloc/food_bloc.dart';
import 'package:bloc_food/events/food_event.dart';
import 'package:bloc_food/model/food.dart';
import 'package:bloc_food/state/food_list.dart';
import 'package:bloc_food/state/food_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodForm extends StatefulWidget {
  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  String _foodname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coding with Cury'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bloc Tutorial',
              style: TextStyle(
                fontSize: 42,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(labelText: 'Food'),
              style: TextStyle(fontSize: 22),
              onChanged: (text) {
                setState(() {
                  _foodname = text;
                });
              },
            ),
            FoodList(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'button1',
            child: Icon(Icons.save),
            // adding an event to the FoodBloc Stream (the constantly flowing pipe of water)
            onPressed: () => {
              if(_foodname != null) {
                BlocProvider.of<FoodBloc>(context).add(
                    FoodEvent.add(
                        Food(_foodname)
                    ) // pass new food
                )
              }

            },
          ),
          SizedBox(height: 16,),
          FloatingActionButton(
            heroTag: 'button2',
            child: Icon(Icons.navigate_next),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodListScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
