import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemons/Pokemons%20Api/pokemon.dart';
import 'package:pokemons/Pokemons%20Api/pokemons_article.dart';

class PokemonsApiProvider{

  Future<List<Pokemons>> getPokemon() async{
    final responce = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
    if (responce.statusCode == 200){
      String data = responce.body;
      var jsonData = jsonDecode(data);
      PokeListModel poke = PokeListModel.fromMap(jsonData);
      List<Pokemons> pokeListModel =
      poke.poke!.map((e) => Pokemons.fromMap(e)).toList();
      return pokeListModel;
    } else{
      throw Exception('Error');
    }
  }
}










// class PokemonsApiProvider {
//
//   static Future<List> getCoins() async {
//     final url =
//         'https://pokeapi.co/api/v2/pokemon';
//     final responce = await http.get(Uri.parse(url));
//     if (responce.statusCode == 200) {
//       final List<dynamic> pokeJson = json.decode(responce.body);
//       return pokeJson.map((json) => Pokemons.fromJson(json)).toList();
//     } else {
//       throw Exception('Error to Load internet');
//     }
//   }
// }