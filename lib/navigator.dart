import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Pokemon_Bloc/Cubit/navigation_cubit.dart';

import 'Pages/pokemons_list.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
        builder: (context, pokemonId){
          return Navigator(
            pages: [
              MaterialPage(child:  PokemonsList()),
              if (pokemonId != null) MaterialPage(child: Text(pokemonId.toString()))
            ],
            onPopPage: (route, result){
              BlocProvider.of<NavigationCubit>(context).popToPokemonList();
              return route.didPop(result);
            },
          );
        });
  }
}
