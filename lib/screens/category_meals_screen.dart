import 'package:flutter/material.dart';
import 'package:meal_flutter/dummy_data.dart';
import 'package:meal_flutter/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((element) => element.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(title:  Text(categoryTitle!),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability,);
      },itemCount: categoryMeals.length,),
    );
  }
}
