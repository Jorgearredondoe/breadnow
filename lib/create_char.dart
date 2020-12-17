
import 'package:flutter/material.dart';
import 'package:breadnow/create_comp.dart';
import 'package:breadnow/create.dart';
import 'package:flutter/material.dart'; 
void main() => runApp(create_char_route()); 


class create_char extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: create_char_route(), 

    ); 
  } 
} 
  
class create_char_route extends StatefulWidget { 
  @override 
  _create_char_routeState createState() => _create_char_routeState(); 
} 
  
class _create_char_routeState extends State<create_char_route> { 
  var _formKey = GlobalKey<FormState>(); 
  var isLoading = false; 
  
  void _submit() { 
    final isValid = _formKey.currentState.validate(); 
    if (!isValid) { 
      return; 
    }
    else
    {

      Navigator.push(context,MaterialPageRoute(builder: (context) =>  create_comp()));
    } 
    _formKey.currentState.save(); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
                 iconTheme: IconThemeData(
                    color: Colors.black, 
                  ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset(
                      'assets/images/shorticon.png',scale: 2.5,
                    ),
                ],
              ),        
              backgroundColor: Colors.grey[300], 
              elevation: 20.0,

              //esto saca el boton de "return"
              automaticallyImplyLeading: true, 

              //forma del appbar
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
              ),
              ),
            ),

      //body 
      body: Center(
        child:Column( 
          children: <Widget>[

      Flexible( 
        flex:30,
        //form
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Form( 
          key: _formKey, 
          child: Column( 
            children: <Widget>[ 

             
              SizedBox( 
                height: MediaQuery.of(context).size.width * 0.1, 
              ),
              //Name and surname 

              TextFormField( 
                decoration: InputDecoration(
                  labelText: 'Largo (Cm)'
                ), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) { 
                  //Validator 
                }, 
                validator: (value) { 
                  if (value.isEmpty || 
                      !RegExp(r"[0-9]{1,3}") 
                          .hasMatch(value)) { 
                    return 'Solo ingresa números'; 
                  } 
                  return null; 
                }, 
              ), 

              //text input  
              TextFormField( 
                decoration: InputDecoration(labelText: 'Ancho (cm'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                validator: (value) { 
                  if (value.isEmpty|| 
                      !RegExp(r"[0-9]{1,3}") 
                          .hasMatch(value)) { 
                    return 'Solo ingresa números'; 
                  } 
                  return null; 
                }, 
              ),

              TextFormField( 
                decoration: InputDecoration(labelText: 'Alto (cm'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                validator: (value) { 
                  if (value.isEmpty|| 
                      !RegExp(r"[0-9]{1,3}") 
                          .hasMatch(value)) { 
                    return 'Solo ingresa números'; 
                  } 
                  return null; 
                }, 
              ), 

              //text input  
              TextFormField( 
                decoration: InputDecoration(labelText: 'Tipo de Masa'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {},  
                validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Este campo no puede estar vacío'; 
                  } 
                  return null; 
                }, 
              ), 

                TextFormField( 
                decoration: InputDecoration(labelText: 'Observaciones'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
              ), 
              SizedBox( 
                height: MediaQuery.of(context).size.width * 0.1, 
              ), 
              ButtonTheme(
                minWidth: 350.0,
                height: 40.0,
              child:RaisedButton( 

              child: Text("Enviar Pedido", style: TextStyle(fontSize:16, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
              shape: RoundedRectangleBorder(  
              borderRadius: BorderRadius.circular(5)),
              color: Colors.blue[900],
              padding: EdgeInsets.all(8.0),
                onPressed: () => _submit(), 
              ), 
          ),
            ], 
          ), 
        ), 
      ),
        ),
      
          ], 
        ),
      ),
      ); 
  } 
} 