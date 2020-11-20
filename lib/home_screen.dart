import 'package:flutter/material.dart';
import 'package:breadnow/populares.dart';
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
            body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       Align(
                        alignment: Alignment.centerLeft,
                      child:Text(
                        '\n       Categorías',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                       ),
 
                    //destacados
                      Flexible(
                          flex:3,
                          child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) => Padding(
                      
                          padding: EdgeInsets.only(left:30,top:5),
  
                          //width:100, 
                          child:ButtonTheme(
                                  
                                child: RaisedButton(
                                  color: index ==0
                                          ? Colors.red[500]
                                          : index==1
                                            ?Colors.green[500]
                                            :index==2
                                              ?Colors.blue[500]
                                              :Colors.purple[500],
                                  child: index ==0
                                          ? Text('Destacados',style: TextStyle(fontSize: 15),)
                                          : index==1
                                            ?Text('Cerca de ti',style: TextStyle(fontSize: 15),)
                                            :index==2
                                              ?Text('Descuento',style: TextStyle(fontSize: 15),)
                                              :Text('Delivery Gratis',style: TextStyle(fontSize: 15),),
                                  onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => homescreen()),
                                  );
                                  },
                                  ),
                              ),
                          ),
                        ),
                      ),



        //mas populares, contiene imagenes grandes
                       Align(
                        alignment: Alignment.centerLeft,
                        child:Text(
                        '\n\n   Más Populares',
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                       ),


                        Flexible(
                          flex:12,
                          child:ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) => Padding(
                              padding: EdgeInsets.only(left:0,top:10),
                              child:ButtonTheme(
                                  
                                child: FlatButton(
                                  color:Colors.white,
                      
                                  child: index==0
                                        ?Image.asset('assets/images/donuts.jpg',scale: 1,)
                                        :index==1
                                          ?Image.asset('assets/images/marraqueta.jpg',scale: 1,)
                                          :index==2
                                            ?Image.asset('assets/images/pie.jpg',scale: 1,)
                                            :Image.asset('assets/images/cafe.jpg',scale: 1,),


                                  onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => populares()),
                                  );
                                  },
                                  ),
                              ),
                            ),
                            ),
                            ),

              //recomendados imagenes pequeñas 
                           Align(
                            alignment: Alignment.centerLeft,
                            child:Text(
                            '\n   Recomendados',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
      