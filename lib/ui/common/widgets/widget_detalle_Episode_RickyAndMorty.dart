import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/CharacterRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/buildInformationWidget.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/clipRreactWidget.dart';
import 'package:provider/provider.dart';

class DetailWidgetEpisode extends StatelessWidget {
  final dynamic dato;
  final _characterDetailsPadding = 16.0;
  final _characterNameSize = 20.0;

  const DetailWidgetEpisode({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    final characterRickyAndMortyProviders =
          Provider.of<CharacterRickyAndMortyProviders>(context, listen: false);
      // List<CharacterRickyAndMorty> newData = characterRickyAndMortyProviders.characterRickyAndMortyUseCase
      //         .getAllCharacterRickyAndMorty(pagina);
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
                  BuildInformationWidget(
                      icon: Icons.notification_important_rounded,
                      dato: "Hombre",
                      valor: dato.name.toString()),
                  BuildInformationWidget(
                      icon: Icons.numbers,
                      dato: "# Capitulo",
                      valor: dato.episode.toString()),
                  BuildInformationWidget(
                      icon: Icons.date_range,
                      dato: "Fecha Salida",
                      valor: dato.airDate.toString()),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

}
