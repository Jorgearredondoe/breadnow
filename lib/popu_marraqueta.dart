import 'package:flutter/material.dart';
import 'package:breadnow/products.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/cart.dart';


List<Product> _products = List<Product>();
List<Product> _cartList = List<Product>();
void main() =>runApp(p_pan());

class p_pan extends StatefulWidget {
  
  @override
  _p_panState createState() =>_p_panState();
}

class _p_panState extends State<p_pan> {

  initState() {
        void _populateDonuts() {
      var list = <Product>[
        Product(
          name: 'Hallulla',
          subname: 'Panadería',
          image: 'assets/images/hallulla.jpeg',
          price_str: '\$200',
          price: 200,
          
        ),
        Product(
          name: 'Colisa',
          subname: 'Panadería',
          image: 'assets/images/colisa.jpeg',
          price_str: '\$300',
          price: 300,
          
        ),
        Product(
          name: 'Marraqueta',
          subname: 'Panadería',
          image: 'assets/images/marraqueta_small.jpeg',
          price_str: '\$200',
          price: 200,
          
        ),
        Product(
          name: 'Pan Hamburguesa',
          subname: 'Panadería',
          image: 'assets/images/hamburguesa.jpeg',
          price_str: '\$1.100',
          price: 1100,
          
        ),
        Product(
          name: 'Pan Hot Dog',
          subname: 'Panadería',
          image: 'assets/images/hotdog.jpeg',
          price_str: '\$350',
          price: 350,
          
        ),
          Product(
          name: 'Pan Integral',
          subname: 'Panadería',
          image: 'assets/images/integral.jpeg',
          price_str: '\$1.500',
          price: 1500,
          
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
                     iconTheme: IconThemeData(
                    color: Colors.black, 
                  ),
              actions: <Widget>[
                      GestureDetector(
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            color:Colors.black,

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
                                            left: 8.0,
                                            bottom: 8.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: GestureDetector(
                                              child: (!_cartList.contains(item))
                                                  ? Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.white,
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
                                                    var uit=0;
                                                });
                                              },
                                            ),
                                          ),
                                                     
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
                                                      Icons.add_circle,
                                                      color: Colors.green,
                                                    ),
                                              onTap: () {
                                                setState(() {
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

    );
  }
}
