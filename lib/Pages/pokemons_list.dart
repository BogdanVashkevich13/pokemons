import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemons/Pokemons%20Bloc/pokemons_bloc.dart';
import 'package:pokemons/Pokemons%20Bloc/pokemons_state.dart';

import '../Colors/colors.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Pokemonloadedstate) {
            return GridView.builder(
                //itemCount: state.loadedPokemons.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index ){
                  return Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Image.asset('images/pokemon.png'),
                          SizedBox(height: 5,),
                          Text('${state.loadedPokemons[index].name}')
                        ],
                      ),
                    ),
                  );
                },
            );
          }
          if (state is PokemonErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const SizedBox.shrink();
        });
  }
}





