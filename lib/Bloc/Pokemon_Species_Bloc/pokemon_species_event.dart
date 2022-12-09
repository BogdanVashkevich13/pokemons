import 'package:equatable/equatable.dart';

abstract class PokemonSpeciesEvent extends Equatable {
  const PokemonSpeciesEvent();
}

class LoadPokemonSpeciesEvent extends PokemonSpeciesEvent {
  final int id;

  const LoadPokemonSpeciesEvent({required this.id});

  @override
  List<Object> get props => [id];
}
