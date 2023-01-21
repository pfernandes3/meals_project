import 'package:flutter/material.dart';
import 'package:meals_project/components/meal_item.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this._favoriteMeals);
  final List<Meal> _favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return _favoriteMeals.isEmpty
        ? Center(
            child: Text('Nenhuma refeição marcada!'),
          )
        : ListView.builder(
            itemCount: _favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(meal: _favoriteMeals[index]);
            });
  }
}
