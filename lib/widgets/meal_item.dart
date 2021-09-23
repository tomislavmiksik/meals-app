import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        'Unknown';
    }
    return "null";
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        'Unknown';
    }
    return "null";
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //Stacks the title and the picture on top of each other
            //
            //
            Stack(
              children: [
                //Widget that displays the picture of the meal
                //
                //
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //Widget that displays the name of the meal over the picture
                //
                //
                Positioned(
                  bottom: 50,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      color: Colors.black54,
                    ),
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            //Rows containing details about the meal
            //
            //
            Container(
              decoration: const BoxDecoration(
                //shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Color(0xFF2C394B),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //simple icon to indicate duration
                        //
                        //
                        Icon(
                          Icons.schedule,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        //text widget containing duration info
                        //
                        //
                        Text(
                          '$duration min',
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        //simple icon to indicate complexity
                        //
                        //
                        Icon(
                          Icons.assignment,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        //text widget containing complexity info
                        //
                        //
                        Text(
                          complexityText,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        //simple icon to indicate affordability
                        //
                        //
                        Icon(
                          Icons.price_check,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        //text widget containing affordability info
                        //
                        //
                        Text(
                          affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
