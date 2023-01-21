import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);
  final Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) isFavorite;

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  _createSectionContainer(Widget child) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        width: 350,
        height: 250,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Text(
                          meal.ingredients[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  })),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      meal.steps[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }))),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          onToggleFavorite(meal);
        },
        child: Icon(
          isFavorite(meal) ? Icons.star : Icons.star_border,
          color: Colors.black,
        ),
      ),
    );
  }
}
