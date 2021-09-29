import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late String? catTitle;
  late List<Meal> catMeals;
  bool _loadedInitData = false;

  //runs before build and checks if changes have been made to data
  //rarely used usually initState() works if no arguments are being passed on
  //
  @override
  void didChangeDependencies() {
    //getting arguments for the route that is declared in main.dart
    if(!_loadedInitData){
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      catTitle = routeArgs['title'];
      final catId = routeArgs['id'];
      //grouping meals with categories
      catMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState((){
      catMeals.removeWhere((element) => element.id == mealId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      //list of recipes
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: catMeals[index].id,
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
