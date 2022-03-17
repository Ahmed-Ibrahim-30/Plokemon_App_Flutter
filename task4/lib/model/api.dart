import 'dart:convert';

import 'package:http/http.dart';

class PokemonApi {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  getNews() async {
    try {
      Response response = await get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      var list = jsonDecode(response.body); // convert from json to list from dart:convert library
      return list;
    } catch (e) {
      print(e);
    }
  }
}
