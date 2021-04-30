import 'package:flutter/cupertino.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  CustomWidget({this.title, this.color, this.fontWeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style:
            TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
