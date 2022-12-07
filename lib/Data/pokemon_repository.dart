import 'package:dio/dio.dart';
import 'package:pokemons/Data/pokemon.dart';
import 'package:pokemons/Data/pokemon_repository_interface.dart';
import 'package:pokemons/Data/pokemon_result.dart';
import 'package:pokemons/Data/pokemon_species.dart';

class PokemonRepository extends InterfacePokemonRepository {
  static final Dio dio = Dio();
  static const _baseApi = 'https://pokeapi.co/api/v2/pokemon';

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    try {
      Response response = await dio.get('$_baseApi?limit=100&offset=0');

      final pokemonResultResponse = response.data;
      List<PokemonResult> resultPokemon = pokemonResultResponse['results']
          .map<PokemonResult>(
              (resultPokemon) => PokemonResult.fromJson(resultPokemon))
          .toList();

      final pokemons = <PokemonModel>[];
      for (var pokemon in resultPokemon) {
        pokemons.add(await getPokemon(pokemon.name));
      }
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonModel> getPokemon(String name) async {
    try {
      Response response = await dio.get('$_baseApi/$name');
      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonSpecies> getPokemonSpecies(int id) async {
    try {
      Response response = await dio.get('$_baseApi-species/$id');
      final pokemonSpecies = response.data;

      return PokemonSpecies.fromJson(pokemonSpecies);
    } catch (e) {
      rethrow;
    }
  }
}