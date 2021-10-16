// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

late Map mapResponse;
late Map dataResponse;

class Yoda extends StatefulWidget {
  @override
  _YodaState createState() => _YodaState();
}

class _YodaState extends State<Yoda> {
  String textEntered = "";

  apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.funtranslations.com/translate/yoda.json?text=$textEntered"));

    setState(() {
      var mapResponse = json.decode(response.body);
      dataResponse = mapResponse['contents'];
    });
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yoda Translator"),
      ),
      body: Container(
        height: 500,
        width: 500,
        child: Column(
          children: [
            TextField(
              obscureText: false,
              onChanged: (String text) {
                // textEntered = text;
                setState(() {
                  textEntered = text;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  apicall();
                },
                child: Text("Translate")),
            Center(
              child: dataResponse == null
                  ? Text("Data is loading")
                  : Text(dataResponse['translated'].toString()),
            )
          ],

          // Text("Hello")
        ),
      ),
    );
  }
}
