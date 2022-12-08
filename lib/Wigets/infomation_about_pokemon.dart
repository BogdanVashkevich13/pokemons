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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
             Image.network(pokemon.sprites.frontDefault, ),
          ],
        ),
        Text(pokemon.name.toUpperCase()),
        SizedBox(height: 10,),
        Text('Types: ${pokemon.types[0].type.name}'),
        SizedBox(height: 10,),
        Text('Weight: ${pokemon.weight} cm'),
        SizedBox(height: 10,),
        Text('Height: ${pokemon.height} kg'),
      ],
    );
  }
}
// Stack(
// children: [
// Padding(
// padding: EdgeInsets.only(left: 30, right: 30, top: 5, ),
// child: Center(
// child:Image.network(pokemon.sprites.frontDefault, height: 200, width: 200,)
// )
// ),
// Center(
// child:  Column(
// children: [
// SizedBox(height: 50,),
// Text(pokemon.name.toUpperCase()),
// SizedBox(height: 10,),
// Text('Types: ${pokemon.types[0].type.name}'),
// SizedBox(height: 10,),
// Text('Weight: ${pokemon.weight} cm'),
// SizedBox(height: 10,),
// Text('Height: ${pokemon.height} kg'),
// ],
// ),
// ),
// ],
// );
