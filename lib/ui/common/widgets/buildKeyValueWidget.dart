import 'package:flutter/material.dart';

class BuildKeyValueWidget extends StatelessWidget {
  final String dato;
  final String value;
  final _characterInformationKeyValuePadding = 2.0;

  const BuildKeyValueWidget({super.key, required this.dato,required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(bottom: _characterInformationKeyValuePadding),
          child: Text(
            dato,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}