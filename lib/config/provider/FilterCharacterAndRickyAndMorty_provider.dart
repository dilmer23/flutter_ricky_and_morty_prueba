import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/filterCharacterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/use_case/CharacterRickyAndMorty/characterFilterRickyAndMorty_use_case.dart';

//injecion de dependecias ddel use case de pokemon
// cuando se inicie la aplicación  injecten el caso de uso
// se injecta en la app de configuracon de la app app.dart
class FilterCharacterRickyAndMortyProviders extends ChangeNotifier {
  List<FilterCharacterRickyAndMorty> _searchResults = [];
  String _filter = 'alive';
  List<FilterCharacterRickyAndMorty> get searchResults => _searchResults;
  String get filter => _filter;

  final FilterCharacterRickyAndMortyUseCase filtercharacterRickyAndMortyUseCase;
  FilterCharacterRickyAndMortyProviders(
      {required this.filtercharacterRickyAndMortyUseCase});

  void setSearchResults(List<FilterCharacterRickyAndMorty> results) {
    _searchResults = results;
    notifyListeners();
  }

  void setSearFilter(dynamic results) {
    _filter = results;
    notifyListeners();
  }
}
