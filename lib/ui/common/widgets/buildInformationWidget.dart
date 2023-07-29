import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/common/widgets/buildKeyValueWidget.dart';

class BuildInformationWidget extends StatelessWidget {
  final dynamic icon;
  final String dato;
  final String valor;
  final _characterInformationPadding = 16.0;
  final _characterInformationRightPadding = 20.0;

  const BuildInformationWidget(
      {super.key, required this.dato, this.icon, required this.valor});

  @override
  Widget build(BuildContext context) {
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
            color: Colors.white,
          ),
        ),
        BuildKeyValueWidget(
          dato: dato,
          value: valor,
        )
      ],
    );
  }
}
