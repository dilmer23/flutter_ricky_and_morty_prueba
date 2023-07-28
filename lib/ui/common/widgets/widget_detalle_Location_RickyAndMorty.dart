import 'package:flutter/material.dart';

class DetailWidgetLocation extends StatelessWidget {
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

  const DetailWidgetLocation({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(dato.name.toString()),
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
                    dato.name.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _characterNameSize),
                  ),
                ),
                _buildInformationWidget(Icons.all_inclusive, _characterStatus,
                    dato.name.toString()),
                _buildInformationWidget(
                    Icons.pets, _characterSpecies, dato.type.toString()),
                _buildInformationWidget(
                    Icons.person, _characterType, dato.dimension.toString()),
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
        _buildKeyValueWidget(key, value)
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
