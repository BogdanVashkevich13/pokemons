import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/pokemon.dart';
import '../Data/pokemon_species.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({Key? key,
    required this.pokemon,
    required this.pokemonSpecies}) : super(key: key);

  final PokemonModel pokemon;
  final PokemonSpecies pokemonSpecies;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 100),
          child: Card(
            child: Center(
              child:  Column(
                children: [
                  SizedBox(height: 100,),
                  Text('${pokemon.weight}'),
                  Text('${pokemon.weight}'),
                  Text('${pokemon.weight}'),
                  Text('${pokemon.weight}'),
                  Text('Height ${pokemon.weight}'),
                  Text('Height ${pokemon.weight}'),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 25),
          child: Align(
            alignment: Alignment.topCenter,
            child:Image.network(pokemon.sprites.frontDefault),
          ),
        )
      ],
    );
  }
}
