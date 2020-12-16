import 'package:flutter/material.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/search.dart';
import 'package:breadnow/create.dart';
import 'package:breadnow/profile.dart';
import 'package:breadnow/more.dart';





void main() =>runApp(bottom_bar());


class bottom_bar extends StatefulWidget {
  @override
  _bottom_barState createState() =>_bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
  int _currentIndex = 0;

  final List<Widget> _children=[
    homescreen(),
    search(),
    create_prod(),
    profile(),
    more_user(),


  ];
  void onTappedBar(int index)
  {
    setState((){
      _currentIndex=index;
    });
  }
  List<String> ids = [];
  List<String> ids_sub = [];
  List<String> ids_image = [];

  initState() {


  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:_children[_currentIndex],
                    bottomNavigationBar:BottomNavigationBar(
                        onTap: onTappedBar,
                        currentIndex: _currentIndex,
                        type: BottomNavigationBarType.fixed,
                        
                        items: [
                          BottomNavigationBarItem(
                              icon: new Icon(Icons.home),
                              title: new Text('Home'),
                              backgroundColor: Colors.black
                          ),
                          BottomNavigationBarItem(
                            icon: new Icon(Icons.search),
                            title: new Text('Buscar'),
                          ),
            BottomNavigationBarItem(
                              icon: Icon(Icons.file_upload),
                              title: Text('¡Crear!')
                          ),

                          BottomNavigationBarItem(
                              icon: Icon(Icons.perm_identity),
                              title: Text('Perfil')
                          ),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.more_horiz),
                              title: Text('¡Mas!')
                          ),

                        ]),
                  );
                
            }
}