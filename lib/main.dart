import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
var rng =  Random();
void main(List<String> args) async {
  List _data = await getJson();
  print(_data[0]['title']);
  runApp(new MaterialApp(
      title: "PARSING JSON",
      home: new Scaffold(
          appBar: new AppBar(
              title: new Text("JSON PARSE"),
              centerTitle: true,
              backgroundColor: Colors.orangeAccent),
         backgroundColor: Colors.grey.shade300,
          body: new SingleChildScrollView(
            child: Column(children:[
             new Container(
               height: 75,
               margin: EdgeInsets.all(10.0),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.0),
                   color: Colors.white
               ),
               child :  new Center(child: new Text("Lorem Ipsum",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),),),),


             new Container(
                 height: 1200.0,
                 margin: EdgeInsets.all(0.0),
                 width: 700,
                 child : new ListView.builder(
                   shrinkWrap: true,
               physics: ClampingScrollPhysics(),
            itemCount: _data.length,
            padding: const EdgeInsets.all(18.0),
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return Divider();
              final index = position ~/2 ;
                            return new Container(
                                height: 175,

                                margin: EdgeInsets.fromLTRB(1, 0.0 , 1.0 , 2.5) ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white
                                ),
                                child: Card(
                              elevation: 9.5,
                              child: new Row(
                               children:[
                                 Padding(padding : EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0)),

                                 Container(
                                   height: 180,
                           width: 70,
                           child : new CircleAvatar(
                             backgroundColor: Colors.orange,
                             child: Text(_data[index]['title'][0].toUpperCase()),
                           )

                          ),
                                 Padding(padding : EdgeInsets.fromLTRB(20.0,0.0, 10.0, 10.0)),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(padding: EdgeInsets.all(10.0),),
                                     new Text(
                                       _data[index]['id'].toString(),
                                       style: new TextStyle(
                                         fontSize: 25,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     SizedBox(height: 10),
                                     new Text(
                                       _data[index]['title'].substring(0,10),
                                       style: new TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),

                                     SizedBox(height: 10),
  Row(
  mainAxisSize: MainAxisSize.min,
  children: List.generate(5, (index) {
  return Icon(
  index < rng.nextInt(5)? Icons.star : Icons.star_border,
  );})),
      SizedBox(height: 10),
                                     new Text(
                                       _data[index]['body'],
                                       style: new TextStyle(
                                         fontSize: 9.5,
                                         fontWeight: FontWeight.w300,
                                         color: Colors.grey,
                                         fontStyle: FontStyle.italic
                                       ),
                                     ),
                                   SizedBox(height: 10.0,)

                                   ],
                                 )
//                             ,
                            ])));
            },
                 ))])))));
}
//void _showonTapMessage(BuildContext context, String message){
//  var alert1 = new AlertDialog(
//    title: new Text("ALERT!!!",
//    style: new TextStyle(color : Colors.deepPurple),),
//    content: new Text(message,
//    style: new TextStyle(color: Colors.lightBlue),),
//    actions: <Widget>[
//      new FlatButton(onPressed: (){Navigator.pop(context);},
//      child: new Text("Ok"))
//    ],
//  );
//  showDialog(context: context,
//  child : alert1);
//}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
