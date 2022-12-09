import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc_event.dart';
import 'package:pokemons/Bloc/Pokemon_Bloc/pokemon_bloc_state.dart';
import 'package:pokemons/Colors/colors.dart';
import 'package:pokemons/Data/pokemon_repository.dart';
import 'package:pokemons/Presentation/Pages/pokemon_details.dart';

import '../../Data/pokemon.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokeDex();
}

class _PokeDex extends State<PokemonList> {
  final ScrollController _scrollController = ScrollController();
  final List<PokemonModel> pokemonList = [];
  bool loading = false, alLoaded = false;

  mocFetch() async {
    if (alLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(microseconds: 10000));
    List<String>.generate(
        50, (index) => ('Pokemon List ${index + pokemonList.length}'));
    List<PokemonModel> newData = pokemonList.length >= 1154
        ? []
        : List.generate(
            50,
            (index) => PokemonModel(
                id: pokemonList[index].id,
                name: pokemonList[index].name,
                height: pokemonList[index].height,
                weight: pokemonList[index].weight,
                types: pokemonList[index].types,
                species: pokemonList[index].species,
                sprites: pokemonList[index].sprites,
                stats: pokemonList[index].stats,
                abilities: pokemonList[index].abilities,
                baseExperience: pokemonList[index].baseExperience,
                gameIndices: pokemonList[index].gameIndices));
    if (newData.isNotEmpty) {
      pokemonList.addAll(newData);
    }
    setState(() {
      loading = false;
      alLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mocFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        mocFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  //final ScrollController _scrollController = ScrollController();
  // _scrollController.addListener(() {
  // if (_scrollController.position.pixels ==
  // _scrollController.position.maxScrollExtent) {
  // final currentState = context
  //     .read<PokemonBloc>()
  //     .state;
  // if (currentState is PokemonLoadedState) {
  // context
  //     .read<PokemonBloc>().pokemonList;
  // }
  // }
  // });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PokemonBloc(repository: PokemonRepository())..add(LoadPokemonEvent()),
      child: Scaffold(
        backgroundColor: ColorsSet.red,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: scrolUp, icon: const Icon(Icons.arrow_upward)),
          ],
          centerTitle: true,
          backgroundColor: ColorsSet.black,
          title: Text(
            'Pokemon List',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: LayoutBuilder(builder: (context, constrains) {
          return BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonEmptyState ||
                  state is PokemonLoadingState && pokemonList.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsSet.black,
                ));
              } else if (state is PokemonErrorState && pokemonList.isEmpty) {
                return Center(
                  child: Card(
                    elevation: 25,
                    color: ColorsSet.white,
                    child: SizedBox(
                      height: 450,
                      width: 300,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Image.asset(
                            'images/error.png',
                            height: 250,
                            width: 250,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Fail To Load Internet',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: ColorsSet.black,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<PokemonBloc>(context)
                                    .add(LoadPokemonEvent());
                              },
                              child: const Text(
                                'Retry',
                                // style: GoogleFonts.lato(
                                //   textStyle: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 15,
                                //   )
                                // ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is PokemonLoadedState) {
                pokemonList.addAll(state.pokemon);
              }
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: pokemonList.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonList[index];
                    return Material(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PokemonDetails(pokemon: pokemon)),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Card(
                              color: ColorsSet.gray_text,
                              child: GridTile(
                                  child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image.network(
                                      pokemonList[index].sprites.frontDefault),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    pokemonList[index].name.toUpperCase(),
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        color: ColorsSet.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          )),
                    );
                  });
            },
          );
        }),
      ),
    );
  }

  void scrolUp() {
    const double start = 0;
    _scrollController.animateTo(start,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }
}
