import 'package:flutter/material.dart';
import 'package:meal_flutter/dummy_data.dart';
import 'package:meal_flutter/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    displayedMeals = DUMMY_MEALS.where((element) => element.categories.contains(categoryId)).toList();
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(categoryTitle!),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(id:displayedMeals[index].id,title: displayedMeals[index].title, imageUrl: displayedMeals[index].imageUrl, duration: displayedMeals[index].duration, complexity: displayedMeals[index].complexity, affordability: displayedMeals[index].affordability,removeItem: _removeMeal,);
      },itemCount: displayedMeals.length,),
    );
  }
}
