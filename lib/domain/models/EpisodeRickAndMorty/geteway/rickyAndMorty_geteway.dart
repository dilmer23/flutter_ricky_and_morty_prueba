import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';


abstract class EpisodeRickyAndMortyGateway {
  // devuelve metodo lista de pokemon.dart del modelo lista de lo obtenido de la api
  Future<List<EpisodeRickAndMorty>> getEpisodeRickyAndMorty();
}
