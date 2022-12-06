import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemons/Pokemon_Bloc/Cubit/navigation_cubit.dart';
import 'package:pokemons/Pokemon_Bloc/pokemon_bloc.dart';
import 'package:pokemons/Pokemon_Bloc/pokemon_bloc_state.dart';
import '../Colors/colors.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({Key? key}) : super(key: key);

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsSet.blue,
        title: Text('List Pokemons',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: ColorsSet.white,
              fontSize: 25,
            ),
          ),
        ),
      ),

      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoadedState) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                ),
                itemCount: state.pokemon.length,
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () => BlocProvider.of<NavigationCubit>(context)
                          .showPokemonDetails(state.pokemon[index].id),
                      child: Card(
                        child: GridTile(
                            child: Column(
                              children:<Widget> [
                                SizedBox(height: 5,),
                                Image.network(state.pokemon[index].imageUrl, height: 80, width: 80,),
                                SizedBox(height: 5,),
                                Text(state.pokemon[index].name)
                              ],
                            )
                        ),
                      ),
                    )
            );
          } else if (state is PokemonErrorState) {
            return Center(
              child: Text('Error'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
