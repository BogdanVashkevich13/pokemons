import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Pokemons%20Api/pokemon.dart';
import 'package:pokemons/Pokemons%20Bloc/pokemons_event.dart';
import 'package:pokemons/Pokemons%20Bloc/pokemons_state.dart';

import '../Pokemons Api/pokemons_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState>{
  final  PokemonRepository  pokemonRepository;
  PokemonBloc(this.pokemonRepository): super(PokemonLoadingState()){
    _loadNews();
    on<PokemonLoadEvent>((event, emit) async {
      emit(PokemonLoadingState());
      _loadNews();
    });
  }
  Future<void> _loadNews() async {
    try{
      final List<Pokemons> loadedNewsList = await pokemonRepository.getAllPokemons();
      emit(Pokemonloadedstate(loadedPokemons: loadedNewsList));
    } catch (_){
      emit(PokemonErrorState());
    }
  }
}