import 'package:flutter/material.dart';
import 'package:flutter_app17/post.dart';
import "package:http/http.dart" as http;
import 'dart:async';

import "dart:convert";

void main()
{
  runApp(
    MaterialApp(
      home: Myapp()
    )
  );
}
class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  Future<List<Post>> showPosts() async{
    var data= await http.get("https://jsonplaceholder.typicode.com/posts");
    var decoded= json.decode(data.body);

    List <Post> posts=List();
    decoded.forEach((post){
      posts.add(Post(post["title"],post["body"]));
    });
    return posts;

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("JSON",textDirection: TextDirection.ltr,)
      ),
      body: FutureBuilder(
        future: showPosts(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(

                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(snapshot.data[index].title,textDirection:TextDirection.ltr,style: TextStyle(fontSize: 30.0)),
                          Divider(

                          ),
                          Text(snapshot.data[index].text,textDirection:TextDirection.ltr,style: TextStyle(fontSize: 15.0),),
                          Divider(),
                          RaisedButton(
                              child: Text("Read more"),
                              onPressed: (){}
                          )
                        ]

                    ),
                  );
                }
            );
          }
          else{
              return Align(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(),
              );
          }

        }

      )
    );
  }
}
