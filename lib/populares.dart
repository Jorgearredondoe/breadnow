import 'package:flutter/material.dart';

class populares extends StatelessWidget {
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
              automaticallyImplyLeading: true, 

              //forma del appbar
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
              ),
              ),
            ),
    body: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child:Text(
            '\n   Populares: Donuts', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          flex:10,
          child:ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx,int){
              return Card(
                child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation')),
            );
                },
                ),
        ),
      ],
    ),
  
    );
  }
}
