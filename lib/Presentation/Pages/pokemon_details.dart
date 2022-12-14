import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Species_Bloc/pokemon_species_event.dart';
import 'package:pokemons/Data/pokemon.dart';
import 'package:pokemons/Data/pokemon_repository.dart';

import '../../Bloc/Pokemon_Species_Bloc/pokemon_species_state.dart';
import '../../Bloc/Pokemon_Species_Bloc/pokemon_spevies_bloc.dart';
import '../../Colors/colors.dart';
import '../Wigets/infomation_about_pokemon.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonSpeciesBloc(repository: PokemonRepository())
        ..add(LoadPokemonSpeciesEvent(id: pokemon.id)),
      child: Scaffold(
          backgroundColor: ColorsSet.red,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: ColorsSet.black,
            centerTitle: true,
            title: const Text('Pokemon Details'),
            automaticallyImplyLeading: true,
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<PokemonSpeciesBloc, PokemonSpeciesState>(
                      builder: (context, state) {
                    if (state is PokemonSpeciesEmptyState ||
                        state is PokemonSpeciesLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: ColorsSet.black,
                      ));
                    } else if (state is PokemonSpeciesErrorState) {
                      return const Center(
                          child: Text('Failed To Load Internet'));
                    } else if (state is PokemonSpeciesLoadedState) {
                      final pokemonSpecies = state.pokemon;

                      return PokemonInformation(
                        pokemon: pokemon,
                        pokemonSpecies: pokemonSpecies,
                      );
                    }
                    return const Center();
                  }),
                ],
              ),
            );
          })),
    );
  }
}