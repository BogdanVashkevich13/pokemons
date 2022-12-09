import 'package:equatable/equatable.dart';

import '../../Data/pokemon_species.dart';

abstract class PokemonSpeciesState extends Equatable {}

class PokemonSpeciesEmptyState extends PokemonSpeciesState {
  @override
  List<Object> get props => [];
}

class PokemonSpeciesLoadingState extends PokemonSpeciesState {
  @override
  List<Object> get props => [];
}

class PokemonSpeciesLoadedState extends PokemonSpeciesState {
  PokemonSpeciesLoadedState({required this.pokemon});

  final PokemonSpecies pokemon;

  @override
  List<Object> get props => [pokemon];
}

class PokemonSpeciesErrorState extends PokemonSpeciesState {
  final String error;

  PokemonSpeciesErrorState(this.error);

  @override
  List<Object> get props => [error];
}
