import 'package:breadnow/products.dart';
import 'package:flutter/material.dart';
import 'package:breadnow/main.dart';
import 'package:breadnow/checkout.dart';


class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Product> _cart;

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
        Flexible(
          flex:10,
          child:ListView.builder(
            itemCount: _cart.length,
            itemBuilder: (context, index) {
              var item = _cart[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset(
                      item.image,
                    ),
                    title: Text(item.name),
                    trailing: GestureDetector(
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            _cart.remove(item);
                          });
                        }),
                  ),
                ),
              );
            }
            
            ),
        ),
        
        Flexible(
          
          flex:1,
          child:ListView.builder(
            itemCount: _cart.length,
            itemBuilder: (context, idx) {
              
              var item2 = _cart[idx];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child:Text('Price'),
            
               );
            }
              )
        ),
        
             

        
        Flexible(
          flex:1,
          child:ButtonTheme(
          minWidth: 300.0,
          height: 40.0,
          child:RaisedButton(
          child: Text("Continuar Compra", style: TextStyle(fontSize:20, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
          shape: RoundedRectangleBorder(  
          borderRadius: BorderRadius.circular(5)),
          //metodo que lleva a signin.dart 
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => check()),
            );
          },
          color: Colors.blue[900],
          padding: EdgeInsets.all(8.0),

          ), 
          ),
        ),
        ],
      ), 
    );
  }
}