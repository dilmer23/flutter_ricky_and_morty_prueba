import 'dart:convert';

RickyAndMortyLocation rickyAndMortyLocationFromJson(String str) => RickyAndMortyLocation.fromJson(json.decode(str));

String rickyAndMortyLocationToJson(RickyAndMortyLocation data) => json.encode(data.toJson());

class RickyAndMortyLocation {
    final Info info;
    final List<LocationRickyAndMorty> results;

    RickyAndMortyLocation({
        required this.info,
        required this.results,
    });

    factory RickyAndMortyLocation.fromJson(Map<String, dynamic> json) => RickyAndMortyLocation(
        info: Info.fromJson(json["info"]),
        results: List<LocationRickyAndMorty>.from(json["results"].map((x) => LocationRickyAndMorty.fromJson(x))),
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

class LocationRickyAndMorty {
    final int id;
    final String name;
    final String type;
    final String dimension;
    final List<String> residents;
    final String url;
    final DateTime created;
    final String image;

    LocationRickyAndMorty({
        required this.id,
        required this.name,
        required this.type,
        required this.dimension,
        required this.residents,
        required this.url,
        required this.created,
        required this.image
    });

    factory LocationRickyAndMorty.fromJson(Map<String, dynamic> json) => LocationRickyAndMorty(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
        image: "https://rickandmortyapi.com/api/character/avatar/19.jpeg"
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
        "image": image
    };
}
