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
                 iconTheme: IconThemeData(
                    color: Colors.black, 
                  ),
              actions: <Widget>[
             
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
              //var text=item.name;
              //text+=item.price_str;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset(
                      item.image,
                    ),
                    
                    title: Text(item.name,style: TextStyle(fontSize: 17)),
                      trailing: Wrap(
                        spacing: 12,          
                        children: <Widget>[
                        Text(item.price_str,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    
                        GestureDetector(
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            _cart.remove(item);
                          });
                        }),
                        ],
                      ),

                  ),
                ),
              );
            }
            
            ),
        ),
        
        Flexible(
          
          flex:1,

              child:Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 2.0),
                child:Text(getCartTotal(), style: TextStyle(fontSize:25, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.black),),
            
               ),
            
              
        ),
        
             

        
        Flexible(
          flex:2,
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
    String getCartTotal() {
    var total=0;
    for(int i =0; i<_cart.length;i++)
    {
      total+=_cart[i].price;
    }
    String total_str;
    String totalnum=total.toString();
    String totalnum_str=totalnum.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),(Match match) => '${match[1]}.');
    total_str="Total a Pagar: \$";
    total_str+=totalnum_str;
    return total_str;
  }

}