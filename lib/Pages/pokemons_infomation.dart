import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 100),
            child: Card(
              child: Center(
                child:  Column(
                  children: [
                    SizedBox(height: 100,),
                    Text('Height'),
                    Text('Height'),
                    Text('Height'),
                    Text('Height'),
                    Text('Height'),
                    Text('Height'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('images/pokemon.png', height: 150, width: 150,),
            ),
          )
        ],
      ),
    );
  }
}
