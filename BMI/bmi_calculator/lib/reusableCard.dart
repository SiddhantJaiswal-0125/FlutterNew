import 'package:flutter/material.dart';
import 'Constants.dart';

class reusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardchild;

  reusableCard({@required this.colour, this.cardchild, this.Onpress});
  // Color colour;
  final Function Onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: colour,
        ),
      ),
    );
  }
}
