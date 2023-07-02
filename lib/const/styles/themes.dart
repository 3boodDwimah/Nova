import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  focusColor: Colors.white,

  scaffoldBackgroundColor: Color(0xff1c2226),
  accentColor: Colors.white,
  cardColor: Color(0xff2b323a),
  backgroundColor: Color(0xff707070),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff1c2226),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color(0xff1c2226),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),


    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  canvasColor: Color(0xff2d343c),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Color(0xff333739),
  ),
  textTheme: TextTheme(

    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  focusColor: Colors.black,

  accentColor: Color(0xff3E3E3E),
  backgroundColor: Color(0xffCACACA),
  canvasColor: Color(0xffFFFFFF),

  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Color(0xffFAFAFA),
  cardColor: Colors.white,


  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xffFAFAFA),
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Color(0xffFAFAFA),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(

    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Nunito Sans',
);

//Text(
//     'Express Product Delivery',
//     style: TextStyle(
//       fontFamily: 'Nunito Sans',
//       fontSize: 22,
//       color: const Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//     ),
//   )