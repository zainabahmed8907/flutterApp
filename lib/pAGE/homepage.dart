import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:project1/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:project1/second.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  static const String routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var text = "BirceBio";
  //TextEditingController myText = new TextEditingController();
  var url = "https://jsonplaceholder.typicode.com/photo";
  var data;

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
  }

  void initialState() {
    super.initState();
    fetchData();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.redAccent[400],
      appBar: AppBar(
        title: Text(
          "Example",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Icon(Icons.star),
        ],
        backgroundColor: Colors.red[700],
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: data != null
          //if u dont want to use list view builder than use grid viewbuilder
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("ID:${data[index]["id"]}"),
                  subtitle: Text(data[index]["title"]),
                  leading: Image.network(data[index]['url']),
                );
              },
              itemCount: data.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),

      /*
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/birce.jpg'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Which movie is it?',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: myText,
                    decoration: InputDecoration(
                        hintText: 'Enter movie name',
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Image(
                  image: AssetImage('assets/birce.jpg'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Which movie is it?',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: myText,
                    decoration: InputDecoration(
                        hintText: 'Enter movie name',
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // Navigator.push(context, LoginPage.routeName);
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.send),
      ),
    );
  }
}
