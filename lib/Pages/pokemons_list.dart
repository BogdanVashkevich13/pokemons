import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3
          ),
          itemBuilder: (context, index) =>
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/PokeInfo');
                },
                child: Card(
                  child: GridTile(
                      child: Column(
                        children:<Widget> [
                          SizedBox(height: 5,),
                          Image.asset('images/pokemon.png', height: 80, width: 80,),
                          SizedBox(height: 10,),
                          Text('Pokemon Name')
                        ],
                      )
                  ),
                ),
              )
      ),
      );
  }
}
