import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Api_Provider/model.dart';
import 'package:pokemons/Pokemon_Bloc/pokemon_bloc_event.dart';
import 'package:pokemons/Pokemon_Bloc/pokemon_bloc_state.dart';

import '../Api_Provider/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitialState());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadingState();

      try {
        final pokemonPageResponse =
        await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonLoadedState(
            pokemon: pokemonPageResponse.pokemon,
            loadNextPage: pokemonPageResponse.loadNextPage);
      } catch (_) {
        emit(PokemonErrorState());
      }
    }
  }
}

