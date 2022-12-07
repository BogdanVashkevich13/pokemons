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
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 95),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ]),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: BlocBuilder<PokemonSpeciesBloc,
                            PokemonSpeciesState>(builder: (context, state) {
                          if (state is PokemonSpeciesEmptyState || state is PokemonSpeciesLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator(
                                  color: ColorsSet.red,
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
                      ),
                    ),
                  ),
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