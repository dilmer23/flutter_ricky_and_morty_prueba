import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/use_case/CharacterRickyAndMorty/characterFilterRickyAndMorty_use_case.dart';
//injecion de dependecias ddel use case de pokemon
// cuando se inicie la aplicación  injecten el caso de uso
// se injecta en la app de configuracon de la app app.dart
class FilterCharacterRickyAndMortyProviders extends ChangeNotifier{
  final FilterCharacterRickyAndMortyUseCase filtercharacterRickyAndMortyUseCase;
  FilterCharacterRickyAndMortyProviders({required this.filtercharacterRickyAndMortyUseCase});
}