import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/FilterCharacterAndRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/filterCharacterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/clipRreactWidget.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/widget_detalle_Characters_RickyAndMorty.dart';
import 'package:provider/provider.dart';

class BuscadorPorNombre extends StatefulWidget {
  const BuscadorPorNombre({Key? key}) : super(key: key);

  @override
  State<BuscadorPorNombre> createState() => _BuscadorPorNombreState();
}

class _BuscadorPorNombreState extends State<BuscadorPorNombre> {
  List<String> list = <String>['unknown', 'alive', 'dead'];

  @override
  Widget build(BuildContext context) {
    final filterCharName = Provider.of<FilterCharacterRickyAndMortyProviders>(
      context,
      listen: true,
    );
    String dropdownValue = filterCharName.filter;
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
              "Buscador Character",
              style: TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Column(
              children: [
                DropdownButton<String>(
                  icon: const Icon(
                    Icons.filter_alt,
                    color: Colors.white,
                    size: 40,
                  ),
                  value:dropdownValue,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String? value) async {
                    filterCharName.setSearFilter(
                        value); // Usa el método del provider para mandar valor de filter
                  },
                  onTap: () {
                    
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                         decoration: const BoxDecoration(color: Colors.black),
                        child: Row(
                          children: [
                            const Icon(Icons.circle),
                            const SizedBox(width: 10),
                            Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Buscar... nombre',
                    hintStyle: TextStyle(color: Colors.white),

                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ), // Color del borde cuando el TextField está inactivo
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // Color del borde cuando el TextField está activo
                  ),
                  onChanged: (String query) async {
                    List<FilterCharacterRickyAndMorty> results =
                        await filterCharName.filtercharacterRickyAndMortyUseCase
                            .getAllFilterCharacterRickyAndMorty(
                                query, filterCharName.filter);
                    filterCharName.setSearchResults(
                        results); // Usa el método del provider
                  },
                  onSubmitted: (String query) async {
                    List<FilterCharacterRickyAndMorty> results =
                        await filterCharName.filtercharacterRickyAndMortyUseCase
                            .getAllFilterCharacterRickyAndMorty(
                                query, filterCharName.filter);
                    filterCharName.setSearchResults(
                        results); // Usa el método del provider
                  },
                ),
              ],
            ),
            Expanded(child: Consumer<FilterCharacterRickyAndMortyProviders>(
              builder: (context, filterCharName, _) {
                List<FilterCharacterRickyAndMorty> searchResults =
                    filterCharName.searchResults;
                if (searchResults.isEmpty) {
                  return const Center(
                    child: Text(
                      'No se encontraron resultados',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    FilterCharacterRickyAndMorty resultBuscador =
                        searchResults[index];
                    return Column(
                      children: <Widget>[
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailWidget(dato: resultBuscador),
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipRreactCustom(
                                        dato: resultBuscador.image)),
                                Positioned(
                                  bottom: 20,
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: 200,
                                      padding: const EdgeInsets.all(16),
                                      child: Center(
                                        child: Text(
                                          resultBuscador.name.toUpperCase(),
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
