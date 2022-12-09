import 'package:pokemons/Data/pokemon.dart';
import 'package:pokemons/Data/pokemon_species.dart';

abstract class InterfacePokemonRepository {
  Future<List<PokemonModel>> getPokemonList();

  Future<PokemonModel> getPokemon(String name);

  Future<PokemonSpecies> getPokemonSpecies(int id);
}
