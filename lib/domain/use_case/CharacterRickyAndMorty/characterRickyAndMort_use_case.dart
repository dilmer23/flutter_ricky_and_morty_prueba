
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/geteway/characterRickyAndMorty_geteway.dart';

class CharacterRickyAndMortyUseCase {

  final CharacterRickyAndMortyGateway _characterRickyAndMortyGateway;
  //contrcutor donde pida la entreda de 
  CharacterRickyAndMortyUseCase(this._characterRickyAndMortyGateway);
  Future<List<CharacterRickyAndMorty>> getAllCharacterRickyAndMorty(pagina) {
    return _characterRickyAndMortyGateway.getCharacterRickyAndMorty(pagina);
  }
}