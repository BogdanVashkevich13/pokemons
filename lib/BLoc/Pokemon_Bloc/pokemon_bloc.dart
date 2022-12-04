import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Api/Models/pokemons.dart';
import 'package:pokemons/Api/Repositoryes/pokemons_repository.dart';
import 'package:pokemons/BLoc/Pokemon_Bloc/pokemon_event.dart';
import 'package:pokemons/BLoc/Pokemon_Bloc/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonsLoadedState, PokemonsState>{
  final PokemonRepository pokemonRepository;
  PokemonBloc(this.pokemonRepository) : super (PokemonsLoadingState()){
    _loadPokemons();
    on<PokemonsLoadEvent>((event, emit) async {
      emit(PokemonsLoadingState());
      _loadPokemons();
    });
  }
  Future<void>  _loadPokemons() async{
    try{
      final List<PokemonModel> loadedPokemonsList = await pokemonRepository.getPokemonList();
      emit(PokemonsLoadedState(loadedPokemons: loadedPokemonsList));
    } catch(_) {
      emit(PokemonsErrorState());
    }
  }
}