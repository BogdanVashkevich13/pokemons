import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc_event.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc_state.dart';

import '../../Data/pokemon.dart';
import '../../Data/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository repository;
  List<PokemonModel> pokemonList = [];

  PokemonBloc({required this.repository}) : super(PokemonEmptyState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());
      try {
        pokemonList = await repository.getPokemonList();
        emit(PokemonLoadedState(pokemon: pokemonList));
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });
  }
}
