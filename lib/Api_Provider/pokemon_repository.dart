import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemons/Api_Provider/model.dart';
import 'package:pokemons/Data/pokemon_cpecies_info.dart';
import 'package:pokemons/Data/pokemon_info.dart';
class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();
  Future<PokemonPage> getPokemonPage(int pageIndex) async{

    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };
    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPage.fromJson(json);
  }
  Future<PokemonInfoResponce?> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponce.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonSpeciesInfo?> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfo.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}

