import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_cubit.dart';

class NavigationCubit extends Cubit <int> {
  PokemonDetailsCubit pokemonDetailsCubit;
  NavigationCubit({required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId){
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }
   void popToPokemonList (){
    emit(null);
}
}