import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/EpisodeRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/LocationSearchDelegate.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_RickyAndMorty.dart';
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
        title: const Text("Location Rick And Morty APP"),
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
                EpisodeRickAndMorty locationRickyAndMorty =
                    allLocations[index];
                return InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailWidget(dato: locationRickyAndMorty),
                      ),
                    ); // Aquí debes pasar el objeto CharacterRickyAndMorty adecuado
                  }),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 25),
                            Image.network(
                              "https://rickandmortyapi.com/api/character/avatar/19.jpeg",
                              width: 100,
                            ),
                            const SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  locationRickyAndMorty.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  locationRickyAndMorty.episode,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  locationRickyAndMorty.airDate,
                                  style: const TextStyle(fontSize: 15),
                                ),
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
