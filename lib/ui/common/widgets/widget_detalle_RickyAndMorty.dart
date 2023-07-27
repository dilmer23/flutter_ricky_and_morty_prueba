// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';

class DetailWidget extends StatelessWidget {
  final dynamic dato;
  final _characterInformationPadding = 16.0;
  final _characterInformationRightPadding = 20.0;
  final _characterInformationKeyValuePadding = 2.0;
  final _characterDetailsPadding = 16.0;
  final _characterNameSize = 20.0;
  final _characterStatus = 'Status';
  final _characterSpecies = 'Species';
  final _characterType = 'Type';
  final _characterGender = 'Gender';
  final _characterOrigin = 'Origin';
  final _characterLocation = 'Location';

  const DetailWidget({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    // String rutaImagen =
    //     "https://rickandmortyapi.com/api/character/avatar/19.jpeg";
    // dato == EpisodeRickAndMorty ? dato.image =rutaImagen : dato.image;
    

    return Scaffold(
      appBar: AppBar(
        title: Text(dato.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(_characterDetailsPadding),
        child: ListView(children: <Widget>[
          Padding(
             padding: EdgeInsets.symmetric(horizontal: _characterDetailsPadding),
            child: Column(
              children: [
                Image.network(dato.image),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _characterDetailsPadding),
                  child: Text(
                    dato.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _characterNameSize),
                  ),
                ),
                  _buildInformationWidget(Icons.all_inclusive, _characterStatus,
                      dato.status.toString()),
                  _buildInformationWidget(
                      Icons.pets, _characterSpecies, dato.species.toString()),
                  _buildInformationWidget(Icons.person, _characterType, dato.type.toString()),
                  _buildInformationWidget(
                      Icons.wc, _characterGender, dato.gender.toString()),
                  _buildInformationWidget(
                      Icons.public, _characterOrigin, dato.origin.name),
                  _buildInformationWidget(
                      Icons.place, _characterLocation, dato.location.name),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildInformationWidget(IconData icon, String key, String value) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: _characterInformationPadding,
              bottom: _characterInformationPadding,
              right: _characterInformationRightPadding,
              left: _characterInformationPadding),
          child: Icon(
            icon,
            color: Colors.grey[600],
          ),
        ),
        _buildKeyValueWidget(key, value),
      ],
    );
  }

  Widget _buildKeyValueWidget(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(bottom: _characterInformationKeyValuePadding),
          child: Text(
            key,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(value),
      ],
    );
  }
}
