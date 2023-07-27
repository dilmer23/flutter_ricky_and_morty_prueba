import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/geteway/rickyAndMorty_geteway.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';

class LocationRickyAndMortyUseCase {

  final LocationRickyAndMortyGateway _locationRickyAndMortyGateway;
  //contrcutor donde pida la entreda de _pokeGetaway
  LocationRickyAndMortyUseCase(this._locationRickyAndMortyGateway);
  Future<List<LocationRickyAndMorty>> getAllLocationRickyAndMorty() {
    return _locationRickyAndMortyGateway.getLocationRickyAndMorty();
  }
}