import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  //method for building a list of items dictated by the arguments
  //
  //
  Widget buildSectionList(List<String> items) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFF2C394B),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      //isAlwaysShown: true,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${index + 1}) ${items[index]}'),
              ),
              const Divider(
                color: Colors.white,
              ),
            ],
          );
        },
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        itemCount: items.length,
      ),
    );
  }

  //builder for the items of the detail row below the picture
  //
  Widget buildIconRowItem(String item, context) {
    String firstHalf = item.split(".").first;
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: Color(0xFF2C394B),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      child: Column(
        children: [
          //god forbid someone reads this
          //it works but fuck it's unreadable
          //shows text and icon based on the arguments provided
          Icon(
            firstHalf == 'Complexity'
                ? Icons.assignment
                : firstHalf == 'Affordability'
                    ? Icons.price_check
                    : Icons.schedule,
          ),

          const SizedBox(
            width: 6,
          ),
          item.contains('.')
              ? Text(
                  '${item.split(".").last}',
                )
              : Text('${item.split(".").last} min'),
        ],
      ),
    );
  }

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
        backgroundColor: Color(0xFF082032),
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        //top: false,
        child: SingleChildScrollView(
          child: Column(
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconRowItem(meal.duration.toString(), context),
                  buildIconRowItem(meal.affordability.toString(), context),
                  buildIconRowItem(meal.complexity.toString(), context),
                ],
              ),
              //Container containing the ingredients of the meal
              //
              //
              buildSectionTitle('Ingredients', context),
              buildSectionList(meal.ingredients),

              //Container with the steps for the recipe
              //
              //
              buildSectionTitle('Steps', context),
              buildSectionList(meal.steps),
            ],
          ),
        ),
      ),
    );
  }
}
