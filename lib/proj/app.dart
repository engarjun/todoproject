import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'title': 'Pasta Carbonara',
      'subtitle': 'Creamy pasta dish with bacon and cheese.'
    },
    {
      'title': 'Caprese Salad',
      'subtitle': 'Simple and refreshing salad with tomatoes, mozzarella, and basil.'
    },
    {
      'title': 'Banana Smoothie',
      'subtitle': 'Healthy and creamy smoothie with banana and milk.'
    },
    {
      'title': 'Chicken Stir-Fry',
      'subtitle': 'Quick and flavorful stir-fried chicken with vegetables.'
    },
    {
      'title': 'Grilled Salmon',
      'subtitle': 'Delicious grilled salmon with lemon and herbs.'
    },
    {
      'title': 'Vegetable Curry',
      'subtitle': 'Spicy and aromatic vegetable curry.'
    },
    {
      'title': 'Berry Parfait',
      'subtitle': 'Layered dessert with fresh berries and yogurt.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text(
              recipe['title']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(recipe['subtitle']!),
            onTap: () {
              // Handle item tap if needed
            },
          );
        },
      ),
    );
  }
}
