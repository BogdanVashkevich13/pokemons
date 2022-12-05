import 'package:flutter/cupertino.dart';

class Pokemon {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  Pokemon({required this.id, required this.name});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return Pokemon(id: id, name: name);
  }
}

class PokemonPage{
  final List<Pokemon> pokemon;
  final bool loadNextPage;

  PokemonPage({
    required this.pokemon,
   required this.loadNextPage,
});
factory PokemonPage.fromJson(Map<String, dynamic> json){
  final loadNextPage = json['next'] != null;
  final pokemon = (json['results'] as List).map((listingJson) => Pokemon.fromJson(listingJson)).toList();
  return PokemonPage(pokemon: pokemon, loadNextPage: loadNextPage);
}
}