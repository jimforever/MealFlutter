import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  List<String> _favorateMeals;
  FirstPage(this._favorateMeals) {
    print("FirstPage constructor");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: ListView.builder(
          itemCount: _favorateMeals.length,
          itemBuilder: (ctx, index) => Text(_favorateMeals[index])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          Navigator.pushNamed(context, "/second_page");
        },
      ),
    );
  }
}
