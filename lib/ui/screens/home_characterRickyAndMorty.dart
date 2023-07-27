import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/CharacterRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/LocationSearchDelegate.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_RickyAndMorty.dart';
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

  @override
  Widget build(BuildContext context) {
    final characterRickyAndMortyProviders =
        Provider.of<CharacterRickyAndMortyProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
             'config/asset/imagenes/app_bar.png',
              scale: 12,
            ),
            const SizedBox(
              width: 10,
            )
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
      body: FutureBuilder<List<CharacterRickyAndMorty>>(
        future: characterRickyAndMortyProviders.characterRickyAndMortyUseCase
            .getAllCharacterRickyAndMorty(),
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
                CharacterRickyAndMorty characterRickyAndMorty =
                    allLocations[index];
                return InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailWidget(dato: characterRickyAndMorty),
                      ),
                    ); // Aquí debes pasar el objeto CharacterRickyAndMorty adecuado
                  }),
                  child: Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 25),
                              Image.network(
                                characterRickyAndMorty.image,
                                width: 100,
                              ),
                              const SizedBox(width: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    characterRickyAndMorty.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    characterRickyAndMorty.status.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  // const Text(
                                  //   "Episodios:",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 17,
                                  //   ),
                                  // ),
                                  // Column(
                                  //   children: characterRickyAndMorty.episode
                                  //       .map((nombre) {
                                  //     return Text(nombre);
                                  //   }).toList(),
                                  // ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
