import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  //const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String catId;
  // final String catTitle;
  //
  //
  // CategoryMealsScreen(this.catId, this.catTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container();
        },
        //itemCount: ,
      ),
    );
  }
}
