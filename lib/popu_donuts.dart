import 'package:flutter/material.dart';
void main() =>runApp(p_donuts());

class p_donuts extends StatefulWidget {
  @override
  _p_donutsState createState() =>_p_donutsState();
}

class _p_donutsState extends State<p_donuts> {
  List<String> itemdonuts = [];
  List<String> itemdonuts_sub = [];
  List<String> itemdonuts_image = [];
  initState() {
    super.initState();
    itemdonuts.add("Donuts Arcoiris\nSabor Frutilla");
    itemdonuts_sub.add("Dunkin Donuts");
    itemdonuts_image.add('assets/images/arcoiris.jpeg');

    
  }

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
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child:Text(
                        '\n       Categorías',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ),
                    Flexible(
                      flex:13,
                      child:ListView.builder(
                        itemCount:itemdonuts.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx,idx){
                          return Card(
                            child: ListTile(
                              leading: ConstrainedBox(
                              constraints:
                                  BoxConstraints(minWidth: 10, minHeight: 10),
                              child: Image.asset('${itemdonuts_image[idx]}',scale: 2.5,),
                              ),
                                
                                title: Text('${itemdonuts[idx]}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                subtitle: Text('${itemdonuts_sub[idx]}'),
                            

                                
                                ),

                        );
                            },
                            ),
                      ),



                    ]
            )
    );
  }
}
