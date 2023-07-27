
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/geteway/characterRickyAndMorty_geteway.dart';
import 'package:flutter_app_ricky_morty_prueba/infraestructure/driver_adapter/errors/rickyAndMortyCharacter_api_errors.dart';
import 'package:http/http.dart' as http;

class CharacterRickyAndMortyApi extends CharacterRickyAndMortyGateway {
  @override
  Future<List<CharacterRickyAndMorty>> getCharacterRickyAndMorty() async {
    Uri url = Uri.parse("https://rickandmortyapi.com/api/character");
    // ignore: non_constant_identifier_names
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202){
      final locationRickAndMorty = rickyAndMortyCharacterFromJson(response.body);
      final locationRickAndMortyDetails  = locationRickAndMorty.results;
      return locationRickAndMortyDetails;
    }else{
       throw CharacterRickyAndMortyError();
    }
  }
}