import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Api_Provider/pokemon_repository.dart';

import '../../Data/pokemon_cpecies_info.dart';
import '../../Data/pokemon_details.dart';
import '../../Data/pokemon_info.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId),
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponce;
    final speciesInfo = responses[1] as PokemonSpeciesInfo;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetails() => emit(null);
}



