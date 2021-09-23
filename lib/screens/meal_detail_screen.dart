import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {

    //retrieving arguments [meal id] from the method
    //
    //
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];

    final meal = DUMMY_MEALS.singleWhere((meal) {
      return meal.id == mealId.toString();
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: Colors.deepOrange.withOpacity(0.5),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //Container containing the picture of the meal
          //
          //
          ClipRRect(
            //borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.network(
              meal.imageUrl,
              //height: 400,
              width: double.infinity,
              //fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),

          //Container containing the ingredients of the meal
          //
          //
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFF2C394B),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Scrollbar(
              interactive: true,
              //isAlwaysShown: true,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(meal.ingredients[index]),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                    ],
                  );
                },
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: meal.ingredients.length,
              ),
            ),
          ),

          //Container with the steps for the recipe
          //
          //
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
