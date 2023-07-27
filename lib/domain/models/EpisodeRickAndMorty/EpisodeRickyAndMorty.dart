// To parse this JSON data, do
//
//     final rickyAndMortyEpisode = rickyAndMortyEpisodeFromJson(jsonString);

import 'dart:convert';

RickyAndMortyEpisode rickyAndMortyEpisodeFromJson(String str) => RickyAndMortyEpisode.fromJson(json.decode(str));

String rickyAndMortyEpisodeToJson(RickyAndMortyEpisode data) => json.encode(data.toJson());

class RickyAndMortyEpisode {
    final Info info;
    final List<EpisodeRickAndMorty> results;

    RickyAndMortyEpisode({
        required this.info,
        required this.results,
    });

    factory RickyAndMortyEpisode.fromJson(Map<String, dynamic> json) => RickyAndMortyEpisode(
        info: Info.fromJson(json["info"]),
        results: List<EpisodeRickAndMorty>.from(json["results"].map((x) => EpisodeRickAndMorty.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    final int count;
    final int pages;
    final String next;
    final dynamic prev;

    Info({
        required this.count,
        required this.pages,
        required this.next,
        this.prev,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class EpisodeRickAndMorty {
    final int id;
    final String name;
    final String airDate;
    final String episode;
    final List<String> characters;
    final String url;
    final DateTime created;

    EpisodeRickAndMorty({
        required this.id,
        required this.name,
        required this.airDate,
        required this.episode,
        required this.characters,
        required this.url,
        required this.created,
    });

    factory EpisodeRickAndMorty.fromJson(Map<String, dynamic> json) => EpisodeRickAndMorty(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}
