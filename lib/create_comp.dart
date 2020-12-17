import 'package:flutter/material.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/bottombar.dart';


class create_comp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child:Column(

          children: <Widget>[
            

            Image.asset(
            'assets/images/shorticon.png',
            scale: 3.0
            ),
            new Container(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           //nombre y apellido
              Text('Pedido creado exitosamente',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)
            ),

            ],
            ),
            ),
            

            //boton de registrarse, falta agregar verificacion
            ButtonTheme(
            minWidth: 250.0,
            height: 40.0,
            child:RaisedButton(
            child: Text("CONTINUAR", style: TextStyle(fontSize:16, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
            shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(5)),
            //metodo que lleva a signin.dart 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => bottom_bar()),
              );
            },
            color: Colors.blue[900],
            padding: EdgeInsets.all(8.0),

            ), 
            ),
          ],

        ),

      ),
    );
  }
}