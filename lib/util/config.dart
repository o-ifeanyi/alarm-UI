import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  static TextStyle h1(BuildContext context) => GoogleFonts.poppins(
        fontSize: textSize(context, 6),
        fontWeight: FontWeight.w600,
      );

  static TextStyle h2(BuildContext context) => GoogleFonts.poppins(
        fontSize: textSize(context, 4),
        fontWeight: FontWeight.w700,
      );

  static TextStyle b1(BuildContext context) => GoogleFonts.poppins(
        fontSize: textSize(context, 4),
      );

  static TextStyle b2(BuildContext context) => GoogleFonts.poppins(
        fontSize: textSize(context, 3.3),
        color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.7),
      );

  static TextStyle b3(BuildContext context) => GoogleFonts.poppins(
        fontSize: textSize(context, 3),
        color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.7),
      );

  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double yMargin(BuildContext context, double height) {
    double viewPortHeight = MediaQuery.of(context).size.longestSide;
    viewPortHeight = viewPortHeight > 950 ? 950 : viewPortHeight;
    return height * (viewPortHeight / 100);
  }

  static double xMargin(BuildContext context, double width) {
    double viewPortwidth = MediaQuery.of(context).size.shortestSide;
    viewPortwidth = viewPortwidth > 650 ? 650 : viewPortwidth;
    return width * (viewPortwidth / 100);
  }

  static double textSize(BuildContext context, double size) {
    double viewPortwidth = MediaQuery.of(context).size.shortestSide;
    viewPortwidth = viewPortwidth > 500 ? 500 : viewPortwidth;
    return size * (viewPortwidth / 100);
  }
}
