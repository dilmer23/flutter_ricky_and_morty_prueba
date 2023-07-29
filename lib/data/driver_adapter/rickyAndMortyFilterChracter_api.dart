
import 'dart:developer';
import 'package:flutter_app_ricky_morty_prueba/data/driver_adapter/errors/rickyAndMortyCharacter_api_errors.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/filterCharacterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/geteway/filterCharacterRickyAndMorty_geteway.dart';
import 'package:http/http.dart' as http;

class FilterCharacterRickyAndMortyApi implements FilterCharacterRickyAndMortyGateway {
  @override
  Future<List<FilterCharacterRickyAndMorty>> getFilterCharacterRickyAndMorty(name) async {
    Uri url = Uri.parse("https://rickandmortyapi.com/api/character/?name=$name");
    // ignore: non_constant_identifier_names
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202){
      final locationRickAndMorty = rickyAndMortyCharacterFilterFromJson(response.body);
      final filterlocationRickAndMortyDetails  = locationRickAndMorty.results;
      log("$url");
      return filterlocationRickAndMortyDetails;
    }else{
       throw CharacterRickyAndMortyError();
    }
  }
}