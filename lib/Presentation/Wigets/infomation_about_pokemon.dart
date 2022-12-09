import 'package:flutter/material.dart';
import 'package:pokemons/Colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Data/pokemon.dart';
import '../../Data/pokemon_species.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({Key? key,
    required this.pokemon,
    required this.pokemonSpecies}) : super(key: key);

  final PokemonModel pokemon;
  final PokemonSpecies pokemonSpecies;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 200),
      child: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Card(
            elevation: 25,
            color: ColorsSet.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(pokemon.sprites.frontDefault, ),
                  ],
                ),
                Text(pokemon.name.toUpperCase(),
                style: GoogleFonts.lato(
                  textStyle:  const TextStyle(
                  color: ColorsSet.black,
                  fontSize: 25,
                ),
                ),
                ),
                const SizedBox(height: 20,),
                Text('Type: ${pokemon.types[0].type.name}',
                  style: GoogleFonts.lato(
                    textStyle:  const TextStyle(
                      color: ColorsSet.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text('Weight: ${pokemon.weight} cm',
                  style: GoogleFonts.lato(
                    textStyle:  const TextStyle(
                      color: ColorsSet.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text('Height: ${pokemon.height} kg',
                  style: GoogleFonts.lato(
                    textStyle:  const TextStyle(
                      color: ColorsSet.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}


// Card(
// color: ColorsSet.white,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Stack(
// children: [
// Image.network(pokemon.sprites.frontDefault, ),
// ],
// ),
// Text(pokemon.name.toUpperCase()),
// SizedBox(height: 10,),
// Text('Types: ${pokemon.types[0].type.name}'),
// SizedBox(height: 10,),
// Text('Weight: ${pokemon.weight} cm'),
// SizedBox(height: 10,),
// Text('Height: ${pokemon.height} kg'),
// ],
// ),
// );