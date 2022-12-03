import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemons/Colors/colors.dart';
import 'package:pokemons/Pages/pokemons_list.dart';
import 'package:pokemons/Pokemons%20Api/pokemons_repository.dart';
import 'package:pokemons/Pokemons%20Bloc/pokemons_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
final pokemonRepository = PokemonRepository();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => PokemonBloc(pokemonRepository)
          ),
        ],
        child: Scaffold(
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
          body: PokeList(),
        ),
    );
  }
}
