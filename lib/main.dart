import 'package:flutter/material.dart';
import 'package:flutter_application_1/bv_inicio.dart';
import 'package:flutter_application_1/bv_inicio_admin.dart';
import 'package:flutter_application_1/bv_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/bv_login": (BuildContext context) => Login(),
        "/bv_inicio_admin": (BuildContext context) => Inicio_admin(),
      },
    );
  }
}
