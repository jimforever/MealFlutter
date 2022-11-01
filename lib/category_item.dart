import 'package:flutter/material.dart';
import 'package:meal_flutter/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id,this.title,this.color);

  void selectCategoty(BuildContext context){
    Navigator.of(context).pushNamed('/category-meals',arguments: {'id':id,'title':title});
    // Navigator.of(context).push(MaterialPageRoute(builder: (_){
    //   return  CategoryMealsScreen(id,title);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategoty(context),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color
        ],begin: Alignment.topLeft,end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(title,style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}
