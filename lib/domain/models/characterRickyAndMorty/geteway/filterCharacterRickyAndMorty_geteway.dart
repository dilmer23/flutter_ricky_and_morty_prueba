import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/filterCharacterRickyAndMorty.dart';

abstract class FilterCharacterRickyAndMortyGateway {
  // devuelve metodo lista de  Character del modelo lista de lo obtenido de la api
  Future<List<FilterCharacterRickyAndMorty>> getFilterCharacterRickyAndMorty(name);
}
