import '../../Api/Models/pokemons.dart';

abstract class PokemonsState {}

class PokemonsLoadingState extends PokemonsState {}
class PokemonsLoadedState extends PokemonsState {
  List<PokemonModel> loadedPokemons;
  PokemonsLoadedState({
    required this.loadedPokemons,
});
}
class PokemonsErrorState extends PokemonsState {}