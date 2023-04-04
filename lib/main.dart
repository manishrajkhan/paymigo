import 'package:flutter/material.dart';
import 'package:paymigo/addTrP.dart';
import 'package:paymigo/dashP.dart';
import 'package:paymigo/loginP.dart';
import 'package:paymigo/newCardP.dart';
import 'package:paymigo/newRflP.dart';
import 'package:paymigo/newTrP.dart';
import 'package:paymigo/regP.dart';
import 'package:paymigo/testP.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: '/login',
    routes: {
      '/': (context) => LoginP(),
      '/dash': (context) => DashP(),
      '/newtr': (context) => NewTrP(),
      '/addtr': (context) => AddTrP(),
      '/rflcd': (context) => NewRflP(),
      '/newcd': (context) => NewCardP(),
      // '/delcd': (context) => DecP(),
      '/tests': (context) => TestP(),
      '/login': (context) => LoginP(),
      '/reg': (context) => RegP(),
      // '/edit': (context) => EditP(),
      // '/loading': (context) => LoadingP(),
    },
    theme: ThemeData(
      fontFamily: 'Signika',
    ),
  ));
}