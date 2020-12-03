import 'package:flutter/material.dart';
import 'package:breadnow/populares.dart';
import 'package:breadnow/popu_donuts.dart';
import 'package:flutter/services.dart';
import 'package:breadnow/products.dart';
import 'package:breadnow/cart.dart';

  List<Product> _products = List<Product>();
  List<Product> _cartList = List<Product>();

void main() =>runApp(homescreen());


class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() =>_homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<String> ids = [];
  List<String> ids_sub = [];
  List<String> ids_image = [];

  initState() {



    void _populateDonuts() {
      var list = <Product>[
        Product(
          name: 'Donuts Arcoiris\nSabor Frutilla',
          subname: 'Dunkin Donuts',
          image: 'assets/images/arcoiris.jpeg',
          
        ),
        Product(
          name: 'Donuts Boston\nSabor Boston Cream',
          subname: 'Dunkin Donuts',
          image: 'assets/images/boston_cream.jpeg',
          
        ),
        Product(
          name: 'Donuts Arcoiris\nSabor Chocolate',
          subname: 'Dunkin Donuts',
          image: 'assets/images/donut_arco_choco.jpeg',
          
        ),
        Product(
          name: 'Donuts Chocolate\nRellena con manjar',
          subname: 'Dunkin Donuts',
          image: 'assets/images/manjar_choco.jpeg',
          
        ),
        Product(
          name: 'Donuts Navidad\Sabor Azucar',
          subname: 'Dunkin Donuts',
          image: 'assets/images/donut_navidad.jpeg',
          
        ),
      ];

      setState(() {
        _products = list;
      });
    }

    super.initState();
    _populateDonuts();   
    ids.add("Donuts Arcoiris\nSabor Frutilla");
    ids_sub.add("Dunkin Donuts");
    ids_image.add('assets/images/arcoiris.jpeg');

    ids.add("Crossaint");
    ids_sub.add("El Castaño");
    ids_image.add('assets/images/crossaint.jpeg');
    
    ids.add("Macarons");
    ids_sub.add("Pastelería Brownie");
    ids_image.add('assets/images/macarons.jpeg');

    ids.add("Rollo de Canela");
    ids_sub.add("Cinnabon");
    ids_image.add('assets/images/roll.jpeg');

    ids.add("Frappuccino Navidad");
    ids_sub.add("Starbucks");
    ids_image.add('assets/images/starbuck.jpeg');

    ids.add("Cheesecake de Berries");
    ids_sub.add("Bread & Cake");
    ids_image.add('assets/images/berrie.jpeg');

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
                      GestureDetector(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 36.0,
                            ),
                            if (_cartList.length > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: CircleAvatar(
                                  radius: 8.0,
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    _cartList.length.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        onTap: () {
                          if (_cartList.isNotEmpty)
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Cart(_cartList),
                              ),
                            );
                        },
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
                        '\n   Más Populares',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
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


                                  onPressed: () { index==0
                                                  ?Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()),)
                                                  :index==1
                                                    ?Navigator.push(context,MaterialPageRoute(builder: (context) => populares()),)
                                                    :index==2
                                                    ?Navigator.push(context,MaterialPageRoute(builder: (context) => populares()),)
                                                    :Navigator.push(context,MaterialPageRoute(builder: (context) => populares()),);
                                    
                                  

                                  },
                                  ),
                              ),
                            ),
                            ),
                            ),

              //Nuevoas esta semana imagenes pequeñas 
                           Align(
                            alignment: Alignment.centerLeft,
                            child:Text(
                            '\n   Nuevos esta semana',
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
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
                              child:ButtonTheme(
   
                                child: FlatButton(
                                  color:Colors.white,
                      
                                  child: Image.asset('${ids_image[idx]}',scale: 2.5),
                                        

                                  onPressed: () { idx==0
                                                  ?Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()))
                                                  :idx==1
                                                    ?Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()))
                                                    :idx==2
                                                      ?Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()))
                                                      :idx==3
                                                        ?Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()))
                                                        :idx==4
                                                          ?Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()))
                                                          :Navigator.push(context,MaterialPageRoute(builder: (context) => p_donuts()));
                                  },
                                  ),
                              ),
                                            ),
                                              
                                              title: Text('${ids[idx]}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                              subtitle: Text('${ids_sub[idx]}'),
                                          

                                              
                                          ),

                                        );
                                          },
                                          ),
                          ),
                      
                      
                    ],
                  ),
              

            );
            }
}