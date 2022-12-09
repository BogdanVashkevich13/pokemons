import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Species_Bloc/pokemon_species_event.dart';
import 'package:pokemons/Bloc/Pokemon_Species_Bloc/pokemon_species_state.dart';

import '../../Data/pokemon_repository.dart';
import '../../Data/pokemon_species.dart';

class PokemonSpeciesBloc
    extends Bloc<PokemonSpeciesEvent, PokemonSpeciesState> {
  final PokemonRepository repository;

  PokemonSpeciesBloc({required this.repository})
      : super(PokemonSpeciesEmptyState()) {
    on<LoadPokemonSpeciesEvent>((event, emit) async {
      emit(PokemonSpeciesLoadingState());

      try {
        final PokemonSpecies responsePokemon =
            await repository.getPokemonSpecies(event.id);
        emit(PokemonSpeciesLoadedState(pokemon: responsePokemon));
      } catch (e) {
        emit(PokemonSpeciesErrorState(e.toString()));
      }
    });
  }
}
