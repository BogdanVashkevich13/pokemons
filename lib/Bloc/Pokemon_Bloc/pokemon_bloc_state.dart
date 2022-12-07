import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../Data/pokemon.dart';


abstract class PokemonState extends Equatable {}

class PokemonEmptyState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadedState extends PokemonState {
  PokemonLoadedState({required this.pokemon});
  final List<PokemonModel> pokemon;

  @override
  List<Object> get props => [pokemon];
}

class PokemonErrorState extends PokemonState {
  final String error;

  PokemonErrorState(this.error);

  @override
  List<Object> get props => [error];
}