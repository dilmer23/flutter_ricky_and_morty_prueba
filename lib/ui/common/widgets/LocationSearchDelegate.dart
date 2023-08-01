import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';


class LocationSearchDelegate extends SearchDelegate<dynamic> {
  final List<dynamic> locations;
  final Widget widget;

  LocationSearchDelegate( {required this.locations,required this.widget});


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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget,
              ),
            );
          },
        );
      },
    );
  }
}
