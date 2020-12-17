import 'package:flutter/material.dart';

void main() =>runApp(profile());


class profile extends StatefulWidget {
  @override
  _profileState createState() =>_profileState();
}

class _profileState extends State<profile> {
  List<String> ids = [];
  
  

  initState() {


    super.initState();
    ids.add("Locales Favoritos");


    ids.add("Pagos");
  
    
    ids.add("Promociones");
 

    ids.add("Notificaciones");
 

    ids.add("Modificar Cuenta");
  

    ids.add("Ayuda");

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

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Text('Perfil de Usuario',
                              style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)
                              ),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 5,
                        child: Center(
                          child:Image.asset('assets/images/profile.jpg',scale: 4.0),
                          ),
                      ),
                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('',
                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),


                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Nombre: Admin',
                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('',
                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Email: admin@breadnow.cl',
              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('',
                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Número Teléfono: +56997658456',
              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('',
                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Contraseña: *****',
              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('',
                              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black)),
                            ),
                          ],
                          ),
                      ),

                       Flexible(
                                    flex:13,
                                    child:ListView.builder(
                                      itemCount:ids.length,
                                      shrinkWrap: true,
                                      itemBuilder: (ctx,idx){
                                        return Card(
                                          child: ListTile(
                                            leading: ConstrainedBox(
                                            constraints:
                                                BoxConstraints(minWidth: 10, minHeight: 10),
                                                
                           
                                            ),
                                            
                                              trailing: idx==0
                                              ? Icon(Icons.home)
                                                :idx==1
                                                ?Icon(Icons.money)
                                                  :idx==2
                                                  ?Icon(Icons.money_off)
                                                    :idx==3
                                                    ?Icon(Icons.message)
                                                      :idx==4
                                                      ?Icon(Icons.person)
                                                        :idx==5
                                                          ?Icon(Icons.help)
                                                          :Icon(Icons.home),
                                             
                                 
                                            
                                              title: Text('${ids[idx]}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                              
                                          

                                              
                                          ),

                                        );
                                          },
                                          ),
                          ),




                    ],
              ),
              ),
    );
}
}