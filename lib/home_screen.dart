import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar( 
              actions: <Widget>[
              IconButton(
              icon: new Icon(Icons.search, color: Colors.black),
              onPressed: () => Navigator.pushReplacementNamed(context,"/home_screen"), 
                ),
              ],

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
              automaticallyImplyLeading: false, 

              //forma del appbar
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
              ),
              ),
            ),
            body: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Categorías',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)
                  ),
                ],
              ),
            ),
            );
            }
            }
      