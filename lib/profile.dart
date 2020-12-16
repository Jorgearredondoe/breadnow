import 'package:flutter/material.dart';

void main() =>runApp(profile());


class profile extends StatefulWidget {
  @override
  _profileState createState() =>_profileState();
}

class _profileState extends State<profile> {


  initState() {

    super.initState();

  }
  



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
              automaticallyImplyLeading: true, 

              //forma del appbar
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
              ),
              ),
            ),
              body: SingleChildScrollView(
              child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("PLACEHOLDER"),
                    ],
              ),
              ),
    );
}
}