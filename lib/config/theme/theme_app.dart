import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Colors.black, // Color negro como color primario del tema
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Colors.white, // Texto en blanco
    ),
    headline2: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w900,
      fontSize: 24,
      color: Colors.white, // Texto en blanco
    ),
    headline3: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white, // Texto en blanco
    ),
  ),
);
