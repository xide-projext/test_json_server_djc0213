import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

void main() async {
  const jsonUrl = "webtoon";
  var toons = [];
  try {
    var response = await get(Uri.http("localhost:3000", jsonUrl));
    toons = json.decode(response.body);
  } catch (e) {
    print(e);
  }
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("내 웹툰")),
          body: Row(
              children: toons
                  .map(
                    (item) => Column(children: [
                      Image.network(item['image']!),
                      Text(item['title']!)
                    ]),
                  )
                  .toList()))));
}
