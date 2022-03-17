import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task4/View/pokemon_ui.dart';
import 'package:task4/model/api.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePage_State();
}

class HomePage_State extends State<HomePage> {
  late StreamController _streamController;
  late Stream _stream;
  late PokemonApi _newsApi;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController(); //initialize controller
    _stream = _streamController.stream; //bind the controller to the stream
    _newsApi = PokemonApi(); //initialize the NewsApi class
    getNews();
  }

  getNews() async {
    var response =
        await _newsApi.getNews(); // the returned list from getNews function
    _streamController.add(response); // add the whole list to the stream
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var Mydata = snapshot.data as Map;
            return ListView.builder(
                itemCount: Mydata["pokemon"].length,
                itemBuilder: (context, index) {
                  index=index*2; 
                  return Column(
                    children: [
                      Row(
                        children: [
                          Pokemon_Ui(index, data: Mydata["pokemon"][index++]),
                          Pokemon_Ui(index, data: Mydata["pokemon"][index]),
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Pokemon_Ui(
                            index,
                            connection: false,
                          ),
                          Pokemon_Ui(index, connection: false),
                        ],
                      ),
                    ],
                  );
                });
          }
        });
  }
}
