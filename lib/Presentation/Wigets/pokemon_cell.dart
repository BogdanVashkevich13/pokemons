
import 'package:flutter/material.dart';
import 'package:pokemons/Colors/colors.dart';
import '../../Data/pokemon.dart';
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
          crossAxisCount: 2
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
              child: Padding(padding: const EdgeInsets.all(5),
                child:  Card(
                  color: ColorsSet.white,
                  child: GridTile(
                      child: Column(
                        children: <Widget> [
                          const SizedBox(height: 10,),
                          Image.network(pokemonList[index].sprites.frontDefault),
                          const SizedBox(height: 10,),
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

