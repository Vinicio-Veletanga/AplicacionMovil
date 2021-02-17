import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/consumo/servicios.dart';


import 'package:flutter_application_1/vista/index.dart';



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


void main() {
  runApp(MyApp());
}

var sesion = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BANCA VIRTUAL',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BANCA VIRTUAL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = TextEditingController();
  final pass = TextEditingController();

  void _showAlertDialog(BuildContext context, String mensaje) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text("Error"),
      content: Text("$mensaje"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _view() async {
    var username = user.text;
    var password = pass.text;
    var respuesta = await ServiciosDAO.login(username, password);
    if (respuesta.codigo == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Resumen(respuesta)));
    } else {
      _showAlertDialog(context, respuesta.descripcion);
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginaPrincipal(),
    );
  }

  Widget paginaPrincipal() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[100],
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "BANCA VIRTUAL",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 75.0,
            height: 75.0,
          ),
          Text(
            "Ingreso de Clientes",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person),
                  hintText: "Usuario",
                  fillColor: Colors.white,
                  filled: true,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  )),
              textAlign: TextAlign.center,
              controller: user,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Contraseña",
                  fillColor: Colors.white,
                  filled: true,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  )),
              textAlign: TextAlign.center,
              controller: pass,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 50.0,
            width: 200.0,
            child: RaisedButton(
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: () {
                  _view();
                }),
          ),
        ],
      )),
    );
  }
}