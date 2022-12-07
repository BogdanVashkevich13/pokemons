import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc_event.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc_state.dart';
import 'package:pokemons/Data/pokemon_repository.dart';
import 'package:pokemons/Pages/pokemon_details.dart';
import 'package:pokemons/Wigets/pokemon_cell.dart';

import '../Data/pokemon.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokeDex();
}

class _PokeDex extends State<PokemonList> {
  final ScrollController _scrollController = ScrollController();
  final List<PokemonModel> pokemonList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PokemonBloc(repository: PokemonRepository())..add(LoadPokemonEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pokemon List'),
        ),
        body: LayoutBuilder(
            builder: (context, constrains){
              final double maxWidth = constrains.maxWidth;
              return BlocBuilder<PokemonBloc, PokemonState>(
                  builder: (context, state) {
                    if (state is PokemonEmptyState ||
                        state is PokemonLoadingState && pokemonList.isEmpty) {
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                    } else if (state is PokemonErrorState && pokemonList.isEmpty) {
                      return const Center(
                          child: Text(
                              'Failed To Load Internet'
                              ));
                    } else if (state is PokemonLoadedState) {
                      pokemonList.addAll(state.pokemon);
                    }
                    return PokemonCell(pokemonList: pokemonList, maxWidth: maxWidth);
                  },
              );
            }),
      ),
    );
  }
}


