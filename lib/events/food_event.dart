
import 'package:bloc_food/model/food.dart';

enum EventType {add, delete, update}

class FoodEvent {
  Food food;
  int foodIndex;
  EventType eventType;

  FoodEvent.add(Food food) {
    this.eventType = EventType.add;
    this.food = food;
  }

  FoodEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.foodIndex = index;
  }

  FoodEvent.update(int index, Food food) {
    this.eventType = EventType.update;
    this.foodIndex = index;
    this.food = food;
  }

}