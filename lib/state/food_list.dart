import 'package:bloc_food/bloc/food_bloc.dart';
import 'package:bloc_food/events/food_event.dart';
import 'package:bloc_food/model/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {

  int _enable_edit; // holds the current Food index to edit
  TextEditingController _controller;
  String _newText = '';

  void _takeNewText(String text) {
    setState(() {
      _newText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // BlocConsumer is a widget to consume the Bloc state itself
      child: BlocConsumer<FoodBloc, List<Food>>(
        buildWhen: (List<Food> previous, List<Food> current) {
          return true;
        },
        listenWhen: (List<Food> previous, List<Food> current) {
          if(current.length > previous.length) {
            return true;
          }
          return false;
        },
        builder: (context, foodList) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _enable_edit = _enable_edit == index ? -1 : index;
                    });
                  },
                  title: Text(foodList[index].name),
                  subtitle: _enable_edit == index ? Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          _takeNewText(text);
                        },
                        decoration: InputDecoration(
                          labelText: 'Edit here',
                        ),
                      ),
                      FlatButton.icon(
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {
                          BlocProvider.of<FoodBloc>(context).add(
                            FoodEvent.update(index, Food(_newText))
                          );

                          setState(() {
                            _enable_edit = -1;
                          });
                        },
                        icon: Icon(Icons.save),
                        label: Text('Save'),
                      ),
                    ],
                  ) : null,
                  // whenever you want to access a function in your Bloc, use the BlocProvider
                  trailing: FlatButton(
                    onPressed: () => BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(index)),
                    child: Icon(Icons.delete_forever, color: Colors.red,),
                  ),
                ),
              );
            },
          );
        }, // builds when the state changes in the Bloc
        listener: (BuildContext context, foodList) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Added')),
          );
        },
      ),
    );
  }
}
