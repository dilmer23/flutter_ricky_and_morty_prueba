import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/geteway/rickyAndMorty_geteway.dart';
class EpisodeRickyAndMortyUseCase {

  final EpisodeRickyAndMortyGateway _episodeRickyAndMortyGateway;
  //contrcutor donde pida la entreda de _pokeGetaway
 EpisodeRickyAndMortyUseCase(this._episodeRickyAndMortyGateway);
  Future<List<EpisodeRickAndMorty>> getAllEpisodeRickyAndMorty(pagina) {
    return _episodeRickyAndMortyGateway.getEpisodeRickyAndMorty(pagina);
  }
}