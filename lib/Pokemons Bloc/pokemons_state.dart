import 'package:pokemons/Pokemons%20Api/pokemon.dart';

abstract class PokemonState{}
class PokemonLoadingState extends PokemonState {}
class Pokemonloadedstate extends  PokemonState {
  List<Pokemons> loadedPokemons;
  Pokemonloadedstate({
   required this.loadedPokemons,
});
}
class PokemonErrorState extends PokemonState {}

