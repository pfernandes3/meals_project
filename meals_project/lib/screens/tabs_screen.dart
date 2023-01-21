import 'package:flutter/material.dart';
import 'package:meals_project/components/drawer.dart';
import 'package:meals_project/screens/categories_screen.dart';
import 'package:meals_project/screens/favorite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this._favoriteMeals);
  final List<Meal> _favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Refeições Favoritas',
        'screen': FavoriteScreen(widget._favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(_screens![_selectedScreenIndex]['title'].toString())),
      drawer: const DrawerComponent(),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categoria',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
