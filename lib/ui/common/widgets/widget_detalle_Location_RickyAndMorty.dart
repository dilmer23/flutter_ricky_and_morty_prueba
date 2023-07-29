import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/buildInformationWidget.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/clipRreactWidget.dart';

class DetailWidgetLocation extends StatelessWidget {
  final dynamic dato;

  final _characterDetailsPadding = 16.0;
  final _characterNameSize = 20.0;

  const DetailWidgetLocation({super.key, required this.dato});

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
                      icon: Icons.width_normal_outlined,
                      dato: "Nombre",
                      valor: dato.name.toString()),
                  BuildInformationWidget(
                      icon: Icons.egg_alt_rounded,
                      dato: "Origen",
                      valor: dato.type.toString()),
                  BuildInformationWidget(
                      icon: Icons.space_bar_sharp,
                      dato: "Localización",
                      valor: dato.dimension.toString()),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
