import 'package:flutter/cupertino.dart';

Widget buildText({text, size, color, weight}) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
