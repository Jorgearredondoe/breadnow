
import 'package:flutter/material.dart';
import 'package:breadnow/register_complete.dart';
import 'package:breadnow/main.dart';
import 'package:flutter/material.dart'; 
import 'package:rounded_loading_button/rounded_loading_button.dart';
void main() => runApp(signinroute()); 


class signinroute extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: HomePage(), 

    ); 
  } 
} 
  
class HomePage extends StatefulWidget { 
  @override 
  _HomePageState createState() => _HomePageState(); 
} 
  
class _HomePageState extends State<HomePage> { 
  var _formKey = GlobalKey<FormState>(); 
  var isLoading = false; 
  
  void _submit() { 
    final isValid = _formKey.currentState.validate(); 
    if (!isValid) { 
      return; 
    }
    else
    {

      Navigator.push(context,MaterialPageRoute(builder: (context) =>  register_comp()));
    } 
    _formKey.currentState.save(); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
              leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                ),
             
              ),
                title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset(
                      'assets/images/shorticon.png',scale: 2,
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
                    labelText: 'Nombre y Apellido'
                  ),
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) { 
                  //Validator 
                }, 
                validator: (value) { 
                  if (value.isEmpty) 
                           { 
                    return 'Nombre y Apellido invalido'; 
                  } 
                  return null; 
                }, 
              ), 

              TextFormField( 
                decoration: InputDecoration(
                  labelText: 'E-mail'
                ), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) { 
                  //Validator 
                }, 
                validator: (value) { 
                  if (value.isEmpty || 
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") 
                          .hasMatch(value)) { 
                    return 'Email invalido'; 
                  } 
                  return null; 
                }, 
              ), 

              //text input  
              TextFormField( 
                decoration: InputDecoration(labelText: 'N° de Teléfono'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                validator: (value) { 
                  if (value.isEmpty|| 
                      !RegExp(r"^[+]*[0-9]{0,2}[9][0-9]{0,8}") 
                          .hasMatch(value)) { 
                    return 'Numero invalido'; 
                  } 
                  return null; 
                }, 
              ), 

              //text input  
              TextFormField( 
                decoration: InputDecoration(labelText: 'Contraseña'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                obscureText: true, 
                validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Contraseña invalida'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox( 
                height: MediaQuery.of(context).size.width * 0.1, 
              ), 
              ButtonTheme(
                minWidth: 350.0,
                height: 40.0,
              child:RaisedButton( 

              child: Text("REGISTRARSE", style: TextStyle(fontSize:16, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
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