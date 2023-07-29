import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/EpisodeRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/LocationSearchDelegate.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_cargando_custom.dart';
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
  int pagina = 1;
  bool isLoading = false;
  bool reachedMaxPages =
      false; // New variable to track if max pages are reached
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    loadMoreData();
  }

  Future<void> loadMoreData() async {
    if (!isLoading && !reachedMaxPages && pagina <= 3) {
      setState(() {
        isLoading = true;
      });
      final episodeRickyAndMortyProviders =
          Provider.of<EpisodeRickyAndMortyProviders>(context, listen: false);
      List<EpisodeRickAndMorty> newData = await episodeRickyAndMortyProviders
          .episodeRickyAndMortyUseCase
          .getAllEpisodeRickyAndMorty(pagina);
      if (newData.isNotEmpty) {
        setState(() {
          allLocations.addAll(newData);
          pagina++;
          isLoading = false;
        });
      } else {
        reachedMaxPages = true; // No more data to load
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      loadMoreData();
    }
  }

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
                radius: 30,
                backgroundImage:
                    AssetImage("lib/config/asset/imagenes/app_bar.png"),
              ),
              SizedBox(width: 10),
              Text(
                "Episode",
                style: TextStyle(fontSize: 35),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: LocationSearchDelegate(
                      widget: DetailWidgetEpisode(dato: allLocations.first),
                      locations: allLocations),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Container(
            color: Colors.black,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: allLocations.length + 1,
              itemBuilder: (context, index) {
                if (index < allLocations.length) {
                  EpisodeRickAndMorty episodeRickyAndMorty =
                      allLocations[index];
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
                              const ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage(
                                        "lib/config/asset/imagenes/listView.jpg"),
                                  )),
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
                } else {
                  return Center(
                    child:
                        isLoading ? const CargandoCustom() : const SizedBox(),
                  );
                }
              },
            )));
  }
}
