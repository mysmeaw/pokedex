import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_model.dart';
import 'pokemon_service.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonService pokemonService = PokemonService();
  PokemonDetailScreen(
      {required this.title, required this.url, required this.page});
  String title;
  String url;
  String page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        //TODO Display pokemon detail from url
        body: FutureBuilder(
          future: pokemonService.getPokemonDetail(page.toString()),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (snapshot.hasData) {
              PokemonModel data = snapshot.data!;
              String? image;
              image = data.sprites?.frontDefault;
              return Scaffold(
                //TODO Display pokemon detail from url
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: CircleAvatar(
                            radius: 100, backgroundImage: NetworkImage(image!)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                                "Pokemon Name : ${data.name!.toString().toUpperCase()}",
                                style: TextStyle(fontSize: 16)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Max Height: ${data.height!}",
                                style: TextStyle(fontSize: 16)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Max Weight: ${data.weight!}",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
