import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/locationRickyAndMorty_provider%20.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/LocationSearchDelegate.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_cargando_custom.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_Characters_RickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_Location_RickyAndMorty.dart';
import 'package:provider/provider.dart';

class HomeLocationRickyAndMorty extends StatefulWidget {
  const HomeLocationRickyAndMorty({Key? key}) : super(key: key);

  @override
  State<HomeLocationRickyAndMorty> createState() =>
      _HomeLocationRickyAndMortyState();
}

class _HomeLocationRickyAndMortyState extends State<HomeLocationRickyAndMorty> {
  List<LocationRickyAndMorty> allLocations = [];

  @override
  Widget build(BuildContext context) {
    final locationRickyAndMortyProviders =
        Provider.of<LocationRickyAndMortyProviders>(context);

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
              "Location",
              style: TextStyle(fontSize: 35),
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
      body: Container(
        color: Colors.black,
        child: FutureBuilder<List<LocationRickyAndMorty>>(
          future: locationRickyAndMortyProviders.locationRickyAndMortyUseCase
              .getAllLocationRickyAndMorty(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CargandoCustom(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              allLocations = snapshot.data!;
              return ListView.builder(
                itemCount: allLocations.length,
                itemBuilder: (context, index) {
                  LocationRickyAndMorty locationRickyAndMorty =
                      allLocations[index];
                  return InkWell(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailWidgetLocation(dato: locationRickyAndMorty),
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
                                    locationRickyAndMorty.type,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    locationRickyAndMorty.dimension,
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
      ),
    );
  }
}
