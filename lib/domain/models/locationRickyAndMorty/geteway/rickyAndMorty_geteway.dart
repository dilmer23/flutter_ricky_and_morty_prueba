import 'package:flutter_app_ricky_morty_prueba/domain/models/locationRickyAndMorty/locationRickyAndMorty.dart';

abstract class LocationRickyAndMortyGateway {
  // devuelve metodo lista de pokemon.dart del modelo lista de lo obtenido de la api
  Future<List<LocationRickyAndMorty>> getLocationRickyAndMorty(pagina);
}
