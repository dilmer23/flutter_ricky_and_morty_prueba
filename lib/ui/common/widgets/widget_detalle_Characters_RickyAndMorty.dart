import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/buildInformationWidget.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/clipRreactWidget.dart';

class DetailWidget extends StatelessWidget {
  final dynamic dato;
  final _characterDetailsPadding = 16.0;
  final _characterNameSize = 30.0;
  final _characterStatus = 'Status';
  final _characterSpecies = 'Species';
  final _characterType = 'Type';
  final _characterGender = 'Gender';
  final _characterOrigin = 'Origin';
  final _characterLocation = 'Location';

  const DetailWidget({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(dato.name.toString()),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(_characterDetailsPadding),
          child: ListView(children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _characterDetailsPadding),
              child: Column(
                children: [
                  ClipRreactCustom(dato: dato.image),
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _characterDetailsPadding),
                    child: Text(
                      dato.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _characterNameSize,
                          color: Colors.white),
                    ),
                  ),
                  BuildInformationWidget(
                      icon: Icons.all_inclusive,
                      dato: _characterStatus,
                      valor: dato.status.toString()),
                  BuildInformationWidget(
                      icon: Icons.pets,
                      dato: _characterSpecies,
                      valor: dato.species.toString()),
                  BuildInformationWidget(
                      icon: Icons.person,
                      dato: _characterType,
                      valor: dato.type.toString()),
                  BuildInformationWidget(
                      icon: Icons.wc,
                      dato: _characterGender,
                      valor: dato.type.toString()),
                  BuildInformationWidget(
                      icon: Icons.public,
                      dato: _characterOrigin,
                      valor: dato.origin.name.toString()),
                  BuildInformationWidget(
                      icon: Icons.place,
                      dato: _characterLocation,
                      valor: dato.location.name.toString())
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
