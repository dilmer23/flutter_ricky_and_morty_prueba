// To parse this JSON data, do
//
//     final rickyAndMortyCharacter = rickyAndMortyCharacterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RickyAndMortyCharacter rickyAndMortyCharacterFromJson(String str) => RickyAndMortyCharacter.fromJson(json.decode(str));

String rickyAndMortyCharacterToJson(RickyAndMortyCharacter data) => json.encode(data.toJson());

class RickyAndMortyCharacter {
    Info info;
    List<CharacterRickyAndMorty> results;

    RickyAndMortyCharacter({
        required this.info,
        required this.results,
    });

    factory RickyAndMortyCharacter.fromJson(Map<String, dynamic> json) => RickyAndMortyCharacter(
        info: Info.fromJson(json["info"]),
        results: List<CharacterRickyAndMorty>.from(json["results"].map((x) => CharacterRickyAndMorty.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    int count;
    int pages;
    String next;
    String prev;

    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
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

class CharacterRickyAndMorty {
    int id;
    String name;
    Status status;
    String species;
    String type;
    Gender gender;
    Location origin;
    Location location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    CharacterRickyAndMorty({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    factory CharacterRickyAndMorty.fromJson(Map<String, dynamic> json) => CharacterRickyAndMorty(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: json["species"],
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": species,
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

enum Gender {
    FEMALE,
    GENDERLESS,
    MALE,
    UNKNOWN
}

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Genderless": Gender.GENDERLESS,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class Location {
    String name;
    String url;

    Location({
        required this.name,
        required this.url,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

enum Status {
    ALIVE,
    DEAD,
    UNKNOWN
}

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Dead": Status.DEAD,
    "unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
