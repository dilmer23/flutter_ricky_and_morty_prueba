import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/geteway/rickyAndMorty_geteway.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/infraestructure/driver_adapter/errors/rickyAndMortyLocation_api_errors.dart';
import 'package:http/http.dart' as http;

class LocationRickyAndMortyApi extends LocationRickyAndMortyGateway {
  @override
  Future<List<LocationRickyAndMorty>> getLocationRickyAndMorty() async {
    Uri url = Uri.parse("https://rickandmortyapi.com/api/location");
    // ignore: non_constant_identifier_names
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202){
      final locationRickAndMorty = rickyAndMortyLocationFromJson(response.body);
      final locationRickAndMortyDetails  = locationRickAndMorty.results;
      return locationRickAndMortyDetails;
    }else{
       throw LocationRickyAndMortyError();
    }
  }
}