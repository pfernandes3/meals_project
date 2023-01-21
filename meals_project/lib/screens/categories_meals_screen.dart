import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.meals);
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) =>
              MealItem(meal: categoryMeals[index])),
    );
  }
}
