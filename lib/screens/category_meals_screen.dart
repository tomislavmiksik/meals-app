import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    //getting arguments for the route that is declared in main.dart
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    //grouping meals with categories
    final catMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      //list of recipes
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: catMeals[index].title,
            imgUrl: catMeals[index].imageUrl,
            complexity: catMeals[index].complexity,
            affordability: catMeals[index].affordability,
            duration: catMeals[index].duration,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
