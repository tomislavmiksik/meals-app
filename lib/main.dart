import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'dummy_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF082032),
    systemStatusBarContrastEnforced: true,
    statusBarColor: Color(0xFF082032),
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favouriteMeals =[];


  //method used to set filter the available meals using filters and if statements
  //
  //
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filterData['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filterData['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filterData['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filterData['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
    final existingMeal = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >=0 ){
      setState(() {
        _favouriteMeals.removeAt(existingMeal);
      });
    }else{
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id){
    return _favouriteMeals.any((element) => element.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mealz 4 Dayz',

      //ThemeData containing styling information
      //
      //
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
        ),
        canvasColor: const Color(0xFF082032),
        //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Color(0xFFFF4C29)),
        primaryColor: Color(0xFF2C365D),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF082032),
          shadowColor: Colors.transparent,
        ),
        switchTheme: SwitchThemeData(),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              headline1: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
                color: Colors.white,
              ),
              subtitle1: TextStyle(color: Colors.white),
            ),
      ),
      initialRoute: '/',
      //list of all available routes which access the screens
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      //not needed, it opens a default named route if a non declared one is chosen
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },

      //it shows a default fallback page if an unknown(non declared route is chosen)
      //
      //
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
