import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Pages/pokemons_list.dart';
import 'package:pokemons/Pokemon_Bloc/Cubit/details_cubit.dart';
import 'package:pokemons/Pokemon_Bloc/Cubit/navigation_cubit.dart';
import 'package:pokemons/Pokemon_Bloc/pokemon_bloc.dart';
import 'package:pokemons/Pokemon_Bloc/pokemon_bloc_event.dart';

import '../navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create:
              (context)=>PokemonBloc()..add(PokemonPageRequest(page: 0))),
          BlocProvider(create:
              (context)=> NavigationCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context)=> pokemonDetailsCubit)
        ],
        child: const AppNavigator(),
    );
  }
}
