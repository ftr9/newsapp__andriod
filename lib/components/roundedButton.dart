import 'package:flutter/material.dart';

class COMRoundedButton extends StatelessWidget {
  COMRoundedButton({this.innerText, this.bgColor});
  final String innerText;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        innerText,
        style: TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: bgColor),
      padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 18.0),
      margin: EdgeInsets.only(bottom: 15.0),
    );
  }
}
