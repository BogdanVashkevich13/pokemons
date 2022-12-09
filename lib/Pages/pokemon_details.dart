import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Species_Bloc/pokemon_species_event.dart';
import 'package:pokemons/Data/pokemon.dart';
import 'package:pokemons/Data/pokemon_repository.dart';
import 'package:pokemons/Wigets/infomation_about_pokemon.dart';
import '../Bloc/Pokemon_Species_Bloc/pokemon_species_state.dart';
import '../Bloc/Pokemon_Species_Bloc/pokemon_spevies_bloc.dart';
import '../Colors/colors.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key,required this.pokemon}) : super(key: key);
final PokemonModel pokemon;
  @override
  Widget build(BuildContext context) {
    //final PokemonModel pokemon = widget.pokemon;
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
                  BlocBuilder<PokemonSpeciesBloc,
                      PokemonSpeciesState>(builder: (context, state) {
                    if (state is PokemonSpeciesEmptyState || state is PokemonSpeciesLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: ColorsSet.black,
                          ));
                    } else if (state is PokemonSpeciesErrorState) {
                      return Center(
                          child: Text(
                              'Failed To Load Internet'
                          ));
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
//
// Scaffold(
// backgroundColor: ColorsSet.deep_sky_blue,
// appBar: AppBar(
// centerTitle: true,
// title: const Text('Pokemon Details'),
// ),
// body: Stack(
// children: [
// Padding(
// padding: EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 100),
// child: Card(
// child: Center(
// child:  Column(
// children: [
// SizedBox(height: 100,),
// Text('Height'),
// Text('Height'),
// Text('Height'),
// Text('Height'),
// Text('Height'),
// Text('Height'),
// ],
// ),
// ),
// ),
// ),
// Container(
// padding: EdgeInsets.only(top: 25),
// child: Align(
// alignment: Alignment.topCenter,
// child: Image.asset('images/pokemon.png', height: 150, width: 150,),
// ),
// )
// ],
// ),
// );