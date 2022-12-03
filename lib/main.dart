import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/Pages/home_page.dart';
import 'package:pokemons/Pages/pokemons_list.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemons',
      // theme: ThemeData(
      //   primarySwatch: Colors.amber,
      // ),
       initialRoute: '/',
      routes: {
          '/' :(BuildContext context) => const HomePage(),
        '/PokemonList': (BuildContext context) => const PokeList(),
      },
    );
  }
}
