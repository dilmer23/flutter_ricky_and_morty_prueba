import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/filterCharacterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/geteway/filterCharacterRickyAndMorty_geteway.dart';


class FilterCharacterRickyAndMortyUseCase {

  final FilterCharacterRickyAndMortyGateway _filtercharacterRickyAndMortyGateway;
  //contrcutor donde pida la entreda de filtro por nombre
  FilterCharacterRickyAndMortyUseCase(this._filtercharacterRickyAndMortyGateway);
  Future<List<FilterCharacterRickyAndMorty>> getAllFilterCharacterRickyAndMorty(name) {
    return _filtercharacterRickyAndMortyGateway.getFilterCharacterRickyAndMorty(name);
  }
}

