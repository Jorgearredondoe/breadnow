
import 'package:flutter/material.dart';
import 'package:breadnow/register_complete.dart';

//clase de la pagina nueva
class signinroute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child:Column(

          children: <Widget>[
            //boton de regresar a la página anterior, esta ubicado costadoi superiro izquierdo
            new Positioned(
              top: 30.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
              leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
                ),
              backgroundColor: Colors.transparent, //You can make this transparent
              elevation: 0.0, //No shadow
              ),),


            Image.asset(
            'assets/images/shorticon.png',
            scale: 3.0
            ),
            new Container(
            margin:new EdgeInsets.all(20.0),
            child: Column(
            children: <Widget>[
           //nombre y apellido
            TextFormField(
            decoration: InputDecoration(
            labelText: 'Nombre y Apellido'
            ),
            
            ),

            //email
            TextFormField(
            decoration: InputDecoration(
            labelText: 'E-mail'
            ),
            
            ),

            //contraseña
            TextFormField(
            decoration: InputDecoration(
            labelText: 'Contraseña'
            ),
            
            ),

            //numero de celular
            TextFormField(
            decoration: InputDecoration(
            labelText: 'Numero de celular'
            ),
            
            ),
            ],
            ),
            ),
            

            //boton de registrarse, falta agregar verificacion
            ButtonTheme(
            minWidth: 250.0,
            height: 40.0,
            child:RaisedButton(
            child: Text("REGISTRARSE", style: TextStyle(fontSize:16, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
            shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(5)),
            //metodo que lleva a signin.dart 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => register_comp()),
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