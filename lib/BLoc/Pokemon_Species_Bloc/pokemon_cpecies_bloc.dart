import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/BLoc/Pokemon_Species_Bloc/pokemon_species_event.dart';
import 'package:pokemons/BLoc/Pokemon_Species_Bloc/pokemon_species_state.dart';

import '../../Api/Models/pokemons.dart';
// import '../../Api/Repositoryes/pokemons_repository.dart';
//
// class PokemonSpeciesBloc extends Bloc<PokemonSpeciesEvent, PokemonsSpeciesState>{
//   final PokemonRepository pokemonRepository;
//   PokemonSpeciesBloc(this.pokemonRepository): super(PokemonsSpeciesLoadingState()){
//     _loadSpeciesPokemons();
//     on<PokemonSpeciesLoadEvent>((event, emit) async {
//       emit(PokemonsSpeciesLoadingState());
//       _loadSpeciesPokemons();
//     });
//   }
//   Future<void> _loadSpeciesPokemons() async {
//     try{
//       final List<PokemonModel> loadedSpeciesPokemonsList = await pokemonRepository.getPokemonList();
//       emit(PokemonsSpeciesLoadedState(loadedPokemons: loadedSpeciesPokemonsList));
//     } catch (_){
//       emit(PokemonsSpeciesErrorState());
//     }
//   }
// }