import '../Api_Provider/model.dart';

abstract class PokemonState{}

class PokemonInitialState extends PokemonState {}
class PokemonLoadingState extends PokemonState {}
class PokemonLoadedState extends PokemonState {
  final List<Pokemon> pokemon;
  final bool loadNextPage;

  PokemonLoadedState({
    required this.pokemon,
    required this.loadNextPage
  });
}
class PokemonErrorState extends PokemonState {}
