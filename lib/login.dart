
import 'package:flutter/material.dart';
import 'package:breadnow/register_complete.dart';
import 'package:breadnow/main.dart';
import 'package:flutter/material.dart'; 
import 'package:breadnow/user.dart';

void main() => runApp(login_bread()); 
List<User> _User = List<User>();
int checker=0;
int value_check=0;
class login_bread extends StatelessWidget { 
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
  initState() {
      void _populateUsers() {
      var list = <User>[
        User(
          name: 'Jorge Arredondo',
          //image: 'assets/images/arcoiris.jpeg',
          mail: 'joarredondo@alumnos.uai.cl',
          password: 'qwerty123',
          id: 1,
          number: '+56992524581',
        ),

          User(
            name: 'admin',
            //image: 'assets/images/arcoiris.jpeg',
            mail: 'admin@breadnow.cl',
            password: 'admin',
            id: 0,
            number: '+56992524581',
        ),
        
      ];

      setState(() {
        _User = list;
      });
    }
  
     super.initState();
    _populateUsers(); 
  }

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
              //mail
              TextFormField( 
                decoration: InputDecoration(
                  labelText: 'E-mail'
                ), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) { 
                  //Validator 
                },

                validator: (value) { 

                  for(int i=0;i<_User.length;i++)
                  {
                    if(value==(_User[i].mail))
                    {
                      checker=1;
                      value_check=i;
                    }
                  }
                  if (value.isEmpty || checker!=1){ 
                    return 'Email o Contraseña invalido'; 
                  } 
                  return null; 
                }, 
              ), 

              //contraseña  
              TextFormField( 
                decoration: InputDecoration(labelText: 'Contraseña'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                obscureText: true, 
                validator: (value) { 
                  if (value.isEmpty || value!=_User[value_check].password) { 
                    return 'Email o Contraseña invalida'; 
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