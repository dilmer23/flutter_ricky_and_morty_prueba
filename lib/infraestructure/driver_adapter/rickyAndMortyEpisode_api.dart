import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/EpisodeRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/EpisodeRickAndMorty/geteway/rickyAndMorty_geteway.dart';
import 'package:flutter_app_ricky_morty_prueba/infraestructure/driver_adapter/errors/rickyAndMortyEpisode_api_errors.dart';
import 'package:http/http.dart' as http;

class EpisodenRickyAndMortyApi extends EpisodeRickyAndMortyGateway {
  @override
  Future<List<EpisodeRickAndMorty>> getEpisodeRickyAndMorty() async {
    Uri url = Uri.parse("https://rickandmortyapi.com/api/episode");
    // ignore: non_constant_identifier_names
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202){
      final episodeRickAndMorty = rickyAndMortyEpisodeFromJson(response.body);
      final episodeRickAndMortyDetails  = episodeRickAndMorty.results;
      return episodeRickAndMortyDetails;
    }else{
       throw EpisodeRickyAndMortyError();
    }
  }
}