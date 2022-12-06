import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/Data/pokemon_details.dart';
import 'package:pokemons/Pokemon_Bloc/Cubit/details_cubit.dart';

import '../Colors/colors.dart';

class PokemonInfomation extends StatelessWidget {
  const PokemonInfomation({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsSet.deep_sky_blue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Pokemon Name'),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
          builder: (context, details){
            return details != null
              ? Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 100),
                  child: Card(
                    child: Center(
                      child:  Column(
                        children: [
                          SizedBox(height: 100,),
                          Text('Height ${details.name}'),
                          Text('Height ${details.name}'),
                          Text('Height ${details.name}'),
                          Text('Height ${details.name}'),
                          Text('Height ${details.name}'),
                          Text('Height ${details.name}'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(details.imageUrl, height: 150, width: 150,),
                  ),
                )
              ],
            )
                : Center(child: CircularProgressIndicator(),);
          }
      ),
    );
  }
}


