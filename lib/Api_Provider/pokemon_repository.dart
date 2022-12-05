import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemons/Api_Provider/model.dart';
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
}

