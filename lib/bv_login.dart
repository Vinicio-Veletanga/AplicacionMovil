import 'package:flutter/material.dart';
import 'package:flutter_application_1/bv_inicio_admin.dart';
import 'package:flutter_application_1/bv_inicio_empleado.dart';
import 'package:flutter_application_1/bv_inicio_cliente.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Peticionget extends StatelessWidget {
  Future<http.Response> pedidos() async {
    String men = "SE PRESENTA ALGO";
    print(men);

    var resp = await http.get(
        'http://10.0.2.2:8080/BancaVirtualF/ws/clientes/listartransaccion?cedula=0706719291');
    print(resp);
    print(resp.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: RaisedButton(
        child: Text("Listar Transaciones"),
        onPressed: () {
          pedidos();
        },
      ),
    );
  }
}

class obtener extends StatelessWidget {
  Future<String> obtenertransacciones() async {
    var respues = await http.get(
        "http://192.168.0.3/BancaVirtualF/ws/clientes/listartransaccion?cedula=0706719291");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('LOGIN USUARIO'),
      ),
      body: Peticionget(),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Login Usuario',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Transferencia'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Actualizacion Registro'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
