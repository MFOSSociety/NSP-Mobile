import 'dart:async';
import 'dart:convert';
import 'package:nsp/internal/data.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final String url = "http://thensp.pythonanywhere.com/api/users/";
  List<Data> convertedData;

  @override
  void initState() {
    super.initState();
    getJsonData().then((data) {
      var dataMap = json.decode(data);
      convertedData = (dataMap as List).map((i) => Data.fromJson(i)).toList();
    });
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    return response.body;
  }

  List<Widget> userCards() {
    List<Widget> ret = new List<Widget>();
    final double textSize = 20.0;
    final TextStyle textStyle = new TextStyle(fontSize: textSize);

    if (convertedData == null) {
      getJsonData().then((data) {
        var dataMap = json.decode(data);
        convertedData = (dataMap as List).map((i) => Data.fromJson(i)).toList();
      });
    }

    for (Data d in convertedData) {
      ret.add(new Card(
          child: new Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(d.username, style: textStyle),
            new Text(d.email)
          ],
        ),
      )));
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = userCards();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("NSP"),
        ),
        body: new SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: cards),
            )));
  }
}
