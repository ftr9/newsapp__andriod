import 'package:flutter/material.dart';

const kTextField = InputDecoration(
  hintText: "Search",
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  fillColor: Colors.red,
  icon: Icon(
    Icons.search,
    size: 30.0,
  ),
);

const kTextStylePrimary = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

const kTextStylSecondary = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kTextStyleTertiary = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const kmidprimary = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  height: 1.4,
  fontSize: 26.0,
);

const kNavBarMargin = SizedBox(
  width: 25.0,
);
