import 'dart:developer';
import 'package:flutter_app_ricky_morty_prueba/config/const/constanstes.dart';
import 'package:flutter_app_ricky_morty_prueba/data/driver_adapter/errors/rickyAndMortyCharacter_api_errors.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/filterCharacterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/geteway/filterCharacterRickyAndMorty_geteway.dart';
import 'package:http/http.dart' as http;

class FilterCharacterRickyAndMortyApi
    extends FilterCharacterRickyAndMortyGateway {
  @override
  Future<List<FilterCharacterRickyAndMorty>> getFilterCharacterRickyAndMorty(
      name, filter) async {
    Uri url =
        Uri.parse("${Constantes.api}/character/?name=$name&status=$filter");
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      final locationRickAndMorty =
          rickyAndMortyCharacterFilterFromJson(response.body);
      final filterlocationRickAndMortyDetails = locationRickAndMorty.results;
      log("$url");
      return filterlocationRickAndMortyDetails;
    } else {
      throw CharacterRickyAndMortyError();
    }
  }
}
