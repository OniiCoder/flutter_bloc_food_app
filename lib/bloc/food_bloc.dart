
import 'package:bloc_food/events/food_event.dart';
import 'package:bloc_food/model/food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBloc extends Bloc<FoodEvent, List<Food>> {
  @override
  List<Food> get initialState => List<Food>();

  @override
  Stream<List<Food>> mapEventToState(FoodEvent event) async* {
    switch(event.eventType) {
      case EventType.add:
        List<Food> newState = List.from(state);
        if(event.food != null) {
          newState.add(event.food);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Food> newState = List.from(state); // state is the current state from the Bloc
        newState.removeAt(event.foodIndex);
        yield newState;
        break;
      case EventType.update:
        List<Food> newState = List.from(state);
        newState.replaceRange(event.foodIndex, event.foodIndex + 1, [event.food]);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');

    }
  }

}