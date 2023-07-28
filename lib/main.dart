import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async{
 await Future.delayed( const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(const RickyAndMortyApp());
}

