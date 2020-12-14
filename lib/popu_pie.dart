import 'package:flutter/material.dart';
import 'package:breadnow/products.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/cart.dart';


List<Product> _products = List<Product>();
List<Product> _cartList = List<Product>();
void main() =>runApp(p_pie());

class p_pie extends StatefulWidget {
  
  @override
  _p_pieState createState() =>_p_pieState();
}

class _p_pieState extends State<p_pie> {

  initState() {
    //populate list of products
      void _populateDonuts() {
      var list = <Product>[
        Product(
          name: 'Pie de Limón',
          subname: 'Pastelería',
          image: 'assets/images/piedelimon.jpeg',
          price_str: '\$7000',
          price: 7000,
          
        ),
        Product(
          name: 'Kutchen Fruta',
          subname: 'Pastelería',
          image: 'assets/images/kuchen.jpeg',
          price_str: '\$6000',
          price: 6000,
          
        ),
        Product(
          name: 'Kutchen Frambuesa',
          subname: 'Panadería',
          image: 'assets/images/kuchenframbuesa.jpeg',
          price_str: '\$8000',
          price: 8000,
          
        ),
        Product(
          name: 'Torta Crema',
          subname: 'Pastelería',
          image: 'assets/images/torta.jpeg',
          price_str: '\$11000',
          price: 11000,
          
        ),
        Product(
          name: 'Torta Tres Leches',
          subname: 'Pastelería',
          image: 'assets/images/torta3leches.jpeg',
          price_str: '\$17500',
          price: 17500,
          
        ),

      ];

      setState(() {
        _products = list;
      });
    }

    super.initState();
    _populateDonuts();   
    

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
               appBar: AppBar(
              actions: <Widget>[
                      GestureDetector(
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            size: 48.0,
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


                    Align(
                        alignment: Alignment.centerLeft,
                        child:Text(
                        '\n       Populares: Pan',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ),

                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                                      width:50,
                                      height:50,
                                      ),
                                    Text(item.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    Text(item.price_str,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
            ),
            ),
    bottomNavigationBar: new Container(
      height: 80.0,
      color: Colors.white,
      padding: new EdgeInsets.only(top: 20.0),
      child: new Theme(

        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            bottomAppBarColor: Colors.green,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))), // sets the inactive color of the `BottomNavigationBar`
        child:
        new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex:0 ,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Home'),
                  backgroundColor: Colors.black
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.search),
                title: new Text('Search'),
              ),
BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border,color: Colors.transparent,),
                  title: Text('Center')
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  title: Text('Person')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  title: Text('More')
              ),

            ]),
      ),
    ),

    );
  }
}
