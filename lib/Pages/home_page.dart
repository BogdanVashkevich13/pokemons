import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Species_Bloc/pokemon_spevies_bloc.dart';
import 'package:pokemons/Pages/pokemons_list.dart';

import '../Data/pokemon_repository.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pokemonRepository = PokemonRepository();
    return MultiBlocProvider(providers: [
      BlocProvider<PokemonBloc>(
          create: (_) => PokemonBloc(repository: pokemonRepository)
      ),
      BlocProvider<PokemonSpeciesBloc>(
          create: (_) => PokemonSpeciesBloc(repository: pokemonRepository)
      )
    ],
      child: const PokemonList(),
    );
  }
}
