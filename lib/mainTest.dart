import 'package:flutter/material.dart';
import 'package:meal_flutter/dummy_data.dart';
import 'package:meal_flutter/screens/categories_screen.dart';
import 'package:meal_flutter/screens/category_meals_screen.dart';
import 'package:meal_flutter/screens/filters_screen.dart';
import 'package:meal_flutter/screens/meal_detail_screen.dart';
import 'package:meal_flutter/screens/tabs_screen.dart';
import 'package:meal_flutter/test_screens/first_page.dart';
import 'package:meal_flutter/test_screens/second_page.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _favoriteMeals = [];

  void _toggleFavorite(String title) {
    print("title is $title");
    final existingIndex =
        _favoriteMeals.indexWhere((_title) => _title == title);
    if (existingIndex >= 0) {
      setState(() {
        print("remove at ${existingIndex}");
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        print("add at ${existingIndex}");
        _favoriteMeals.add(title);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                ),
              )),
      initialRoute: '/',
      routes: {
        '/': (ctx) => FirstPage(_favoriteMeals),
        '/second_page': (ctx) => SecondPage(_toggleFavorite),
      },
      // onGenerateRoute: (settings){
      //   print("onGenerateRoute");
      //   print(settings.arguments);
      //   //return MaterialPageRoute(builder: (ctx)=> const CategoriesScreen());
      //
      //
      // },
      // onUnknownRoute: (settings){
      //   print("onUnknownRoute");
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=> const CategoriesScreen());
      //
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('DeliMeals'),
      ),
      body: const Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Text(
              'Navigation Time!')), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}