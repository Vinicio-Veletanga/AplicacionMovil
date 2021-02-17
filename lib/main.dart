import 'package:flutter/material.dart';
import 'package:flutter_application_1/bv_inicio.dart';
import 'package:flutter_application_1/bv_inicio_admin.dart';
import 'package:flutter_application_1/bv_login.dart';

import 'package:flutter_application_1/requestResponseFromJson.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

//void main(List<String> arguments) {
//  final url = "https://reqres.in/api/users?page=2";

//  http.get(url).then((resp) {
//    final responseJson = welcomeFromJson(resp.body);
//    print(responseJson);
    //final body = jsonDecode(resp.body);
    //print(body);
//    print("Page: ${responseJson.page}");ndom
//    print("Per_page: ${responseJson.perPage}");
//    print("Id del Tercer Elemento: ${responseJson.data[2].lastName}");
//  });


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
