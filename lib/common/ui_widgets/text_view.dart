import 'package:flutter/widgets.dart';

class Textview2 extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;
  Color color;
  TextDecoration textDecoration;
  TextAlign textAlign;
  double letterSpacing;
  Color backgroundColor;
  double lineHeight;

  Textview2({this.title,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.textDecoration,
    this.textAlign,
    this.lineHeight,
    this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: 2,
      style: TextStyle(
        backgroundColor: backgroundColor,
        fontFamily: 'Sans',
        letterSpacing: letterSpacing,
        height: lineHeight,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
        fontSize: fontSize,

      ),
    );
  }
}
