import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mealz 4 Dayz',
      //ThemeData containing styling information
      //
      //
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
        ),
        canvasColor: const Color(0xFF082032),
        //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Color(0xFFFF4C29)),
        primaryColor: Color(0xFF2C365D),
        appBarTheme: AppBarTheme(
          color: Color(0xFF082032),
          shadowColor: Colors.transparent,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              headline1: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
                color: Colors.white,
              ),
            ),
      ),
      initialRoute: '/',
      //list of all available routes which access the screens
      routes: {
        '/': (ctx)=> TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
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
