import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/EpisodeRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/LocationSearchDelegate.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_Characters_RickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_Episode_RickyAndMorty.dart';
import 'package:provider/provider.dart';

class HomeEpisodeRickyAndMorty extends StatefulWidget {
  const HomeEpisodeRickyAndMorty({Key? key}) : super(key: key);

  @override
  State<HomeEpisodeRickyAndMorty> createState() =>
      _HomeEpisodeRickyAndMortyState();
}

class _HomeEpisodeRickyAndMortyState extends State<HomeEpisodeRickyAndMorty> {
  List<EpisodeRickAndMorty> allLocations = [];

  @override
  Widget build(BuildContext context) {
    final episodeRickyAndMortyProviders =
        Provider.of<EpisodeRickyAndMortyProviders>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: const <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  AssetImage("lib/config/asset/imagenes/app_bar.png"),
            ),
            SizedBox(width: 10),
            Text("Episodios Ricky And Morty")
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: LocationSearchDelegate(allLocations),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<EpisodeRickAndMorty>>(
        future: episodeRickyAndMortyProviders.episodeRickyAndMortyUseCase
            .getAllEpisodeRickyAndMorty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            allLocations = snapshot.data!;
            return ListView.builder(
              itemCount: allLocations.length,
              itemBuilder: (context, index) {
                EpisodeRickAndMorty episodeRickyAndMorty = allLocations[index];
                return InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailWidgetEpisode(dato: episodeRickyAndMorty),
                      ),
                    ); // Aquí debes pasar el objeto CharacterRickyAndMorty adecuado
                  }),
                  child: Card(
                    borderOnForeground: true,
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              child: Image.network(
                                'https://rickandmortyapi.com/api/character/avatar/19.jpeg',
                                height: 145.0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.movie),
                                    Text(
                                      episodeRickyAndMorty.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.numbers),
                                    Text(
                                      episodeRickyAndMorty.episode,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
