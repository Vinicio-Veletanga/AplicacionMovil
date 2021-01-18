import 'package:flutter/material.dart';
import 'package:flutter_application_1/bv_login.dart';

class MyHomePage extends StatelessWidget {
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
        title: Text('INICIO'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Pagina Inicio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              trailing: RaisedButton(
                onPressed: () {
                  _login(context);
                }, //**this line is underlined in red. Error is here**
                color: Colors.green[200],
                padding: const EdgeInsets.all(10.0),
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _login(BuildContext context) {
    Navigator.of(context).pushNamed("/bv_login");
  }
}
