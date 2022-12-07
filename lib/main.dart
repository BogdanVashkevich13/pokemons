import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'Pages/pokemon_details.dart';


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
        //'/PokeInfo' :(BuildContext context) =>  PokemonDetails(),
      },
    );
  }
}
