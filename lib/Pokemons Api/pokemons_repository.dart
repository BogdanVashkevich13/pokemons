import 'package:pokemons/Pokemons%20Api/pokemon.dart';
import 'package:pokemons/Pokemons%20Api/pokemons_api_provider.dart';

class PokemonRepository{
  final PokemonsApiProvider _pokemonsApiProvider = PokemonsApiProvider();
  Future<List<Pokemons>> getAllPokemons() => _pokemonsApiProvider.getPokemon();
}