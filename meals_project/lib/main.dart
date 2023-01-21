import 'package:flutter/material.dart';
import 'package:meals_project/data/dummy_data.dart';
import 'package:meals_project/models/meal.dart';
import 'package:meals_project/screens/meal_detail_screen.dart';
import 'package:meals_project/screens/settings_screen.dart';
import 'models/settings.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app-routes.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((element) {
        final filterGluten = settings.isGlutenFree && !element.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !element.isLactoseFree;
        final filterVegan = settings.isVegan && !element.isVegan;
        final filterVegetarian = settings.isVegetarian && !element.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toglleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite (Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 30, fontFamily: 'Raleway'),
            ),
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(_toglleFavorite,_isFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
