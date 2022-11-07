import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final Function _toggleFavorite;

  SecondPage(this._toggleFavorite) {
    print("SecondPage constructor is  called");
  }

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<String> favorateMeals = [
    "android",
    "ios",
    "python",
    "java",
    "react-native",
    "flutter"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("SecondPage initState is called");
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(child: Text("second page")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () => widget._toggleFavorite(favorateMeals[count++]),
      ),
    );
  }
}
