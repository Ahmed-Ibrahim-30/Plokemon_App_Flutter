import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task4/model/pokemonspicture.dart';

class Pokemon_Ui extends StatelessWidget {
  final dynamic data;
  final int index;
  final bool connection;
  late Pokemon news;
  Pokemon_Ui(this.index,{ this.data,this.connection=true}) {
    if(data!=null)news = Pokemon(data['name'], data['img']);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 12, right: 5),
            child: Container(
                alignment: Alignment.center,
                height: 167,
                width: 167,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 100,
                          height: 100,
                          child: connection?Image.network(news.getPictureurl):Image.asset("assets/images/pokemon.jpeg")
                          ),
                      SizedBox(height: 5),
                      Text(connection?news.getname:"Pokemon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ))),
      ],
    );
  }
}
