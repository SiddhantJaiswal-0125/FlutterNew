import 'package:flutter/material.dart';
import 'Constants.dart';

class icon_content extends StatelessWidget {
  final String data;
  final IconData fi;
  icon_content({@required this.data, this.fi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fi,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          data,
          style: label,
        )
      ],
    );
  }
}
