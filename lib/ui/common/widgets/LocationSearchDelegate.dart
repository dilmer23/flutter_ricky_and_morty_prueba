import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
class LocationSearchDelegate extends SearchDelegate<dynamic> {
  final List<dynamic> locations;

  LocationSearchDelegate(this.locations);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.delete),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(
            context); // Simplemente usar Navigator.pop(context) sin pasar el resultado (null)
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = locations
        .where((location) =>
            location.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        LocationRickyAndMorty locationRickyAndMorty = results[index];
        return Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    "https://rickandmortyapi.com/api/character/avatar/486.jpeg",
                    width: 80,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = locations
        .where((location) =>
            location.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        dynamic locationRickyAndMorty = suggestions[index];
        return ListTile(
          title: Text(locationRickyAndMorty.name),
          onTap: () {
            _showDetailsModal(context, locationRickyAndMorty);
          },
        );
      },
    );
  }

  void _showDetailsModal(BuildContext context, dynamic location) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el modal sea de tamaño completo
      builder: (context) {
        return Container(
          // Estilo del modal
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "https://rickandmortyapi.com/api/character/avatar/486.jpeg",
                  width: 200,
                ),
                const SizedBox(height: 16),
                Text(
                  "Nombre: ${location.name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text("Tipo: ${location.type}"),
                const SizedBox(height: 8),
                // Text("Dimensión: ${location.dimension}"),
                // Puedes agregar más información aquí según tus necesidades
              ],
            ),
          ),
        );
      },
    );
  }
}