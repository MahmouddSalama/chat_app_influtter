import 'package:flutter/material.dart';

class CategorySelect extends StatefulWidget {
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  final List<String> category = ['Messages', 'Online', 'Groups', 'Requests'];
  int _crunt = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      height: 100,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _crunt = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Text(
                category[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: _crunt == index ? Colors.white : Colors.white38,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
