import 'package:flutter/material.dart';
import 'package:breadnow/products.dart';
import 'package:breadnow/home_screen.dart';
import 'package:breadnow/cart.dart';


List<Product> _products = List<Product>();
List<Product> _cartList = List<Product>();
void main() =>runApp(p_cafe());

class p_cafe extends StatefulWidget {
  
  @override
  _p_cafeState createState() =>_p_cafeState();
}

class _p_cafeState extends State<p_cafe> {

  initState() {
        void _populateDonuts() {
      var list = <Product>[
        Product(
          name: 'Café Americano',
          subname: 'Cafetería',
          image: 'assets/images/americano.jpeg',
          price_str: '\$1800',
          price: 1800,
          
        ),
        Product(
          name: 'Café Capuccino',
          subname: 'Cafetería',
          image: 'assets/images/capuccino.jpeg',
          price_str: '\$2000',
          price: 2000,
          
        ),
        Product(
          name: 'Café Expresso',
          subname: 'Cafetería',
          image: 'assets/images/expresso.jpeg',
          price_str: '\$1000',
          price: 1000,
          
        ),
        Product(
          name: 'Frapuccino Chocolate',
          subname: 'Starbucks',
          image: 'assets/images/frapuccino.jpeg',
          price_str: '\$4000',
          price: 4000,
          
        ),
        Product(
          name: 'Frapuccino Manjar',
          subname: 'Starbucks',
          image: 'assets/images/frapuccino2.jpeg',
          price_str: '\$4000',
          price: 4000,
          
        ),
          Product(
          name: 'Café Latte',
          subname: 'Cafetería',
          image: 'assets/images/latte.jpeg',
          price_str: '\$1900',
          price: 1900,
          
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
            currentIndex:4 ,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Home'),
                  backgroundColor: Colors.black,
                         
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
    

    );
  }
}