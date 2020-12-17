import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:breadnow/create_char.dart';

void main() =>runApp(create_prod());


class create_prod extends StatefulWidget {
  @override
  _create_prodState createState() =>_create_prodState();
}

class _create_prodState extends State<create_prod> {
  GlobalKey _globalKey =new GlobalKey();

  Future<Uint8List> _capturePng() async{
    try {
      print('inside');
      RenderRepaintBoundary boundary=
        _globalKey.currentContext.findRenderObject();
      ui.Image image =await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData=
        await image.toByteData(format: ui.ImageByteFormat.png);
      
      var pngBytes=byteData.buffer.asUint8List();
      var bs64=base64Encode(pngBytes);

      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;

    }
    catch (e){
      print(e);
    }


  }

DrawingController controller;
  initState() {
    controller = new DrawingController();
    controller.onChange().listen((draw){
      //do something with it
    });
    super.initState();

  }
  



Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: new Scaffold(
              appBar: AppBar(
                 iconTheme: IconThemeData(
                    color: Colors.black, 
                  ),
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

              body: Center(
              child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        //flex:10,
                      child: Whiteboard(
                        controller: controller,
                      ),
                      ),

                      ButtonTheme(
                        minWidth: 300.0,
                        height: 40.0,

                        child: new RaisedButton(
                          color: Colors.blue[900],
                        padding: EdgeInsets.all(8.0),
                        child: Text("Continuar", style: TextStyle(fontSize:16, fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, color: Colors.white),),
                          onPressed: (){
                          _capturePng;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => create_char()),
                          );

                          }

                          
                          )

                      ),
                    ],
              ),
              ),
    ),
    );
}
}