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
  late PokemonBloc _pokemonBloc;
  final List<PokemonModel> pokemonList = [];
  bool loading = false, alLoaded =false;


  mocFetch() async {
    if (alLoaded){
      return;
    } setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(microseconds: 10000));
    List<String>.generate(50, (index) => ('Pokemon List ${index + pokemonList.length}'));
    List<PokemonModel> newData = pokemonList.length >= 1154
        ? [] : List.generate(50, (index) => PokemonModel(
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
        gameIndices: pokemonList[index].gameIndices
    ));
    if (newData.isNotEmpty){
      pokemonList.addAll(newData);
    } setState(() {
      loading = false;
      alLoaded = newData.isEmpty;
    });
  }

@override
  void initState() {
    super.initState();
    mocFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent
          && !loading){
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
        PokemonBloc(repository: PokemonRepository())
          ..add(LoadPokemonEvent()),
        child: Scaffold(
          appBar: AppBar(
            actions:<Widget> [
              IconButton(
                  onPressed: scrolUp,
                  icon: const Icon(Icons.arrow_upward)
              ),
            ],
            centerTitle: true,
            title: const Text('Pokemon List'),
          ),
          body: LayoutBuilder(
              builder: (context, constrains) {
                return BlocBuilder<PokemonBloc, PokemonState>(
                  builder: (context, state) {
                    if (state is PokemonEmptyState ||
                        state is PokemonLoadingState && pokemonList.isEmpty) {
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                    } else
                    if (state is PokemonErrorState && pokemonList.isEmpty) {
                      return const Center(
                          child: Text(
                              'Failed To Load Internet'
                          ));
                    } else if (state is PokemonLoadedState) {
                      pokemonList.addAll(state.pokemon);
                    }
                    return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2
                        ),
                        itemCount: pokemonList.length,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          final pokemon = pokemonList[index];
                          return Material(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PokemonDetails(pokemon: pokemon)
                                    ),
                                  );
                                },
                                child: Padding(padding: EdgeInsets.all(5),
                                  child: Card(
                                    child: GridTile(
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: 10,),
                                            Image.network(
                                                pokemonList[index].sprites
                                                    .frontDefault),
                                            SizedBox(height: 10,),
                                            Text(pokemonList[index].name
                                                .toUpperCase())
                                          ],
                                        )
                                    ),
                                  ),
                                )
                            ),
                          );
                        }
                    );
                  },
                );
              }),
        ),
      );
    }
    void scrolUp(){
    final double start = 0;
    _scrollController.animateTo(start, duration: const Duration(seconds: 3), curve: Curves.easeIn);
    }
  }


