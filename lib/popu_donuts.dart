import 'package:flutter/material.dart';
import 'package:breadnow/products.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/cart.dart';


List<Product> _products = List<Product>();
List<Product> _cartList = List<Product>();
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
        void _populateDonuts() {
      var list = <Product>[
        Product(
          name: 'Donuts Arcoiris\nSabor Frutilla',
          subname: 'Dunkin Donuts',
          image: 'assets/images/arcoiris.jpeg',
          
        ),
        Product(
          name: 'Donuts Boston',
          subname: 'Dunkin Donuts',
          image: 'assets/images/boston_cream.jpeg',
          
        ),
        Product(
          name: 'Donuts Arcoiris\nSabor Chocolate',
          subname: 'Dunkin Donuts',
          image: 'assets/images/donut_arco_choco.jpeg',
          
        ),
        Product(
          name: 'Donuts Chocolate',
          subname: 'Dunkin Donuts',
          image: 'assets/images/manjar_choco.jpeg',
          
        ),
        Product(
          name: 'Donuts Navidad',
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
    itemdonuts.add("Donuts Arcoiris\nSabor Frutilla");
    itemdonuts_sub.add("Dunkin Donuts");
    itemdonuts_image.add('assets/images/arcoiris.jpeg');

    itemdonuts.add("Donuts Boston\nSabor Boston Cream");
    itemdonuts_sub.add("Dunkin Donuts");
    itemdonuts_image.add('assets/images/boston_cream.jpeg');


    itemdonuts.add("Donuts Arcoiris\nSabor Chocolate");
    itemdonuts_sub.add("Dunkin Donuts");
    itemdonuts_image.add('assets/images/donut_arco_choco.jpeg');


    itemdonuts.add("Donuts Chocolate\nRellena con manjar");
    itemdonuts_sub.add("Dunkin Donuts");
    itemdonuts_image.add('assets/images/manjar_choco.jpeg');


    itemdonuts.add("Donuts Navidad\Sabor Azucar");
    itemdonuts_sub.add("Dunkin Donuts");
    itemdonuts_image.add('assets/images/donut_navidad.jpeg');

    
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

                    Align(
                        alignment: Alignment.centerLeft,
                        child:Text(
                        '\n       Categorías',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ),


                    
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
                        itemCount:_products.length,
            
                        itemBuilder: (ctx,idx){
                          var item = _products[idx];
                          return new Card(
                            child:GridTile(
                            child: Stack(                              
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: <Widget>[
                                    Image.asset(
                                      item.image,
                                      width:60,
                                      height:60,
                                      ),
                                    Text(item.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    Text(item.subname,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                                  ],

                                ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8.0,
                                            bottom: 8.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: GestureDetector(
                                              child: (!_cartList.contains(item))
                                                  ? Icon(
                                                      Icons.add_circle,
                                                      color: Colors.green,
                                                    )
                                                  : Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red,
                                                    ),
                                              onTap: () {
                                                setState(() {
                                                  if (_cartList.contains(item))
                                                    _cartList.remove(item);
                                                  else
                                                    _cartList.add(item);
                                                });
                                              },
                                            ),
                                          ),
                                                     
                                        ),
                              ],
                            ),
                            ),
                          );
                        }, 
                            
                      ),



                    ]
            )
    );
  }
}
