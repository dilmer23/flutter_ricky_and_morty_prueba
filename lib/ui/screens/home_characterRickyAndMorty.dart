import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/CharacterRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/LocationSearchDelegate.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_cargando_custom.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_Characters_RickyAndMorty.dart';
import 'package:provider/provider.dart';

class HomeCharacterRickyAndMorty extends StatefulWidget {
  const HomeCharacterRickyAndMorty({Key? key}) : super(key: key);

  @override
  State<HomeCharacterRickyAndMorty> createState() =>
      _HomeCharacterRickyAndMortyState();
}

class _HomeCharacterRickyAndMortyState
    extends State<HomeCharacterRickyAndMorty> {
  List<CharacterRickyAndMorty> allLocations = [];
  List<dynamic> filteredList = [];
  int pagina = 2;
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

  Future<void> loadMoreData() async {
    if (!isLoading && !reachedMaxPages && pagina <= 43) {
      setState(() {
        isLoading = true;
      });
      final characterRickyAndMortyProviders =
          Provider.of<CharacterRickyAndMortyProviders>(context, listen: false);
      List<CharacterRickyAndMorty> newData =
          await characterRickyAndMortyProviders.characterRickyAndMortyUseCase
              .getAllCharacterRickyAndMorty(pagina);
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
  Widget build(BuildContext context) {
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
              "Character",
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
                    locations: allLocations,
                    widget: DetailWidget(
                        dato: allLocations[0])),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.security_update_warning_sharp),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: allLocations.length + 1,
          itemBuilder: (context, index) {
            if (index < allLocations.length) {
              CharacterRickyAndMorty characterRickyAndMorty =
                  allLocations[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailWidget(dato: characterRickyAndMorty),
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              characterRickyAndMorty.image,
                              height: 145.0,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: <Widget>[
                                  const Text(
                                    "Nombre:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    characterRickyAndMorty.name.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  const Text(
                                    "Estado:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 7.0,
                                    width: 7.0,
                                    decoration: BoxDecoration(
                                      color: characterRickyAndMorty.status.name
                                                  .toString() ==
                                              'ALIVE'
                                          ? Colors.green
                                          : Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Text(
                                        characterRickyAndMorty.status.name
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: isLoading ? const CargandoCustom() : const SizedBox(),
              );
            }
          },
        ),
      ),
    );
  }
}
