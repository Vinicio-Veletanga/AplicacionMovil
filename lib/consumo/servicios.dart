import 'dart:convert';
import 'package:flutter_application_1/modelo/cuenta.dart';
import 'package:flutter_application_1/modelo/respuesta.dart';
import 'package:http/http.dart' as http;

class ServiciosDAO {
  static const String IP = 'localhost';
  static const int PORT = 8080;
  static const String ser1 = 'http://$IP:$PORT/BancaVirtualFinal/ws/clientes/login';
  static const String ser2 =
      'http://$IP:$PORT/BancaVirtualFinal/ws/clientes/cambiocontraseña';
  static const String bus = "http://$IP:$PORT/BancaVirtualFinal/ws/clientes/obtenerCliente";
  static const String ser3 = "http://$IP:$PORT/BancaVirtualFinal/ws/clientes/transferencia";
  static const String ser4 =
      "http://$IP:$PORT/BancaVirtualFinal/ws/clientes/transferenciaExterna";

  static Future<Respuesta> login(username, password) async {
    http.Response response = await http.post(ser1, body: {
      "username": username,
      "password": password,
    });

    Respuesta res = new Respuesta();
    var cue = json.decode(response.body)["Cuenta"];
    //var cres = json.decode(response.body)["Creditos"];
    if (cue != null ) {
  //if (cue != null && cres != null) {
      res.codigo = json.decode(response.body)["codigo"];
      res.descripcion = json.decode(response.body)["descripcion"];
      Cuenta cuenta = Cuenta.fromJson(cue);
      res.cuenta = cuenta;
      /*List<Credito> credis = new List();
      for (var cre in cres) {
        Credito credito = Credito.fromJson(cre);
        credis.add(credito);
      }
      res.creditos = credis;*/
    } else {
      res.codigo = json.decode(response.body)["codigo"];
      res.descripcion = json.decode(response.body)["descripcion"];
    }
    return res;
  }

  static Future<Respuesta> cambioClave(correo, contravieja, contranueva) async {
    http.Response response = await http.post(ser2, body: {
      "correo": correo,
      "contraAntigua": contravieja,
      "contraActual": contranueva,
    });
    Respuesta res = new Respuesta();
    res.codigo = json.decode(response.body)["codigo"];
    res.descripcion = json.decode(response.body)["descripcion"];
    return res;
  }

  static Future<Respuesta> busqueda(numeroCuenta) async {
    final response = await http.get(bus + "?numeroCuenta=$numeroCuenta");
    Respuesta res = new Respuesta();
    var cue = json.decode(response.body)["Cuenta"];
    if (cue != null) {
      Cuenta cuenta = Cuenta.fromJson(cue);
      res.codigo = json.decode(response.body)["codigo"];
      res.descripcion = json.decode(response.body)["descripcion"];
      res.cuenta = cuenta;
    } else {
      res.codigo = json.decode(response.body)["codigo"];
      res.descripcion = json.decode(response.body)["descripcion"];
    }
    return res;
  }

  static Future<Respuesta> transferencia(Map jsonTrans) async {
    var response = await http.post(ser3,
        body: json.encode(jsonTrans),
        headers: {"Content-Type": "application/json"});
    Respuesta res = new Respuesta();
    print(response.body);
    res.codigo = json.decode(response.body)["codigo"];
    res.descripcion = json.decode(response.body)["descripcion"];
    return res;
  }

  static Future<Respuesta> transferenciaExterna(Map jsonTrans) async {
    var response = await http.post(ser4,
        body: json.encode(jsonTrans),
        headers: {"Content-Type": "application/json"});
    Respuesta res = new Respuesta();
    print(response.body);
    res.codigo = json.decode(response.body)["codigo"];
    res.descripcion = json.decode(response.body)["descripcion"];
    return res;
  }
}