
import 'package:breadnow/login.dart';
import 'package:flutter/material.dart';
import 'package:breadnow/signin.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/products.dart';
import 'package:breadnow/login.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BREAD NOW',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BREAD NOW - UAI VALLEY'),
      routes: {
        "/home_screen": (_) => new homescreen(),
      },
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
  int _counter = 0;
  final List<Widget> users=[

  ];

  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //columna página home 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //imagen icono breadnow de página home, escalada a un 33%
           Image.asset('assets/images/icon.png',scale: 3.0
             ),
            //texto titulo del home
            Text(
              '¡Bienvenidos a BREAD NOW!',
              style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)
            ),
            Text("TU PRODUCTO FAVORITO AL INSTANTE", style: TextStyle(fontSize:15, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.grey),),
            Text("Aquí encontrarás el mejor servicio delivery de panaderías y pastelerías en el lugar donde te encuentres", textAlign: TextAlign.center, style: TextStyle(fontSize:13, fontStyle: FontStyle.normal, color: Colors.grey),),
            
            //boton de registrar, lleva al archivo signin.dart
            ButtonTheme(
            minWidth: 300.0,
            height: 40.0,
            child:RaisedButton(
            child: Text("REGISTRARSE", style: TextStyle(fontSize:16, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
            shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(5)),
            //metodo que lleva a signin.dart 
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signinroute()),
              );
            },
            color: Colors.blue[900],
            padding: EdgeInsets.all(8.0),

            ), 
            ),
             TextButton(
            child:Text("¿Ya tienes cuenta?, Ingresa Aquí", style: TextStyle(fontSize:15, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.blue[900]),),
            onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login_bread()),
              );
            },
             ),
          //Text("¿Ya tienes cuenta?, Ingresa Aquí", style: TextStyle(fontSize:12, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.blue[900]),),
          ],
          
        ),
        
  
      ),
    );
  }
}

