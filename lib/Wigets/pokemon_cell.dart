import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/pokemon.dart';
import '../Pages/pokemon_details.dart';

class PokemonCell extends StatelessWidget {
    PokemonCell({Key? key,
    required this.pokemonList,
    required this.maxWidth}) : super(key: key);

  final List<PokemonModel> pokemonList;
  final double maxWidth;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
      ),
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];
        return Material(
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => PokemonDetails(pokemon: pokemon)
                  ),
                );
                // Navigator.pushNamed(context, '/PokeInfo',
                // arguments: pokemonList[index].id);
              },
              child: Padding(padding: EdgeInsets.all(5),
                child:  Card(
                  child: GridTile(
                      child: Column(
                        children: <Widget> [
                          SizedBox(height: 0,),
                          Image.network(pokemonList[index].sprites.frontDefault),
                          SizedBox(height: 0,),
                          Text(pokemonList[index].name.toUpperCase())
                        ],
                      )
                  ),
                ),
              )
          ),
        );
      }

    );
  }
}