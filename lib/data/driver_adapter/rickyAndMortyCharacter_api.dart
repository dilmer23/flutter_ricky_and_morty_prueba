
import 'dart:developer';
import 'package:flutter_app_ricky_morty_prueba/data/driver_adapter/errors/rickyAndMortyCharacter_api_errors.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/geteway/characterRickyAndMorty_geteway.dart';
import 'package:http/http.dart' as http;

class CharacterRickyAndMortyApi implements CharacterRickyAndMortyGateway {
  @override
  Future<List<CharacterRickyAndMorty>> getCharacterRickyAndMorty(pagina) async {
    Uri url = Uri.parse("https://rickandmortyapi.com/api/character?page=$pagina");
    // ignore: non_constant_identifier_names
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202){
      final locationRickAndMorty = rickyAndMortyCharacterFromJson(response.body);
      final locationRickAndMortyDetails  = locationRickAndMorty.results;
      log("$url");
      return locationRickAndMortyDetails;
    }else{
       throw CharacterRickyAndMortyError();
    }
  }
}