import 'package:ui_pizza_party/models/food.dart';

class Restaurant {
  Map<String, List<Food>> menu;
  Restaurant(
    this.menu,
  );

  static Restaurant generatePizza() {
    return Restaurant(
      {
        'Pizza': Food.generatePizza(),
        'Drinks': Food.generateDrinks(),
      },
    );
  }
}
