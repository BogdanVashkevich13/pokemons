import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemonEvent extends PokemonEvent {
  @override
  List<Object> get props => [];
}