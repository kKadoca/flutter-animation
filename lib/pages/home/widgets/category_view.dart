import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  late List<String> categories = [
    'Trabalho',
    'Estudos',
    'Casa',
  ];

  int _category = 0;

  void selectForward() {
    setState(() {
      _category++;
    });
  }

  void selectBackward() {
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: _category > 0 ? selectBackward : null,
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        Text(
          categories[_category].toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.2,
            color: Colors.white
          ),
        ),
        IconButton(
          onPressed: _category < categories.length - 1 ? selectForward : null,
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
        ),
      ],
    );
  }
}
