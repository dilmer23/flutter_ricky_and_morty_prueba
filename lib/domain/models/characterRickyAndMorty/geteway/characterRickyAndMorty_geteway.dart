import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';

abstract class CharacterRickyAndMortyGateway {
  // devuelve metodo lista de  Character del modelo lista de lo obtenido de la api
  Future<List<CharacterRickyAndMorty>> getCharacterRickyAndMorty(pagina);
}
