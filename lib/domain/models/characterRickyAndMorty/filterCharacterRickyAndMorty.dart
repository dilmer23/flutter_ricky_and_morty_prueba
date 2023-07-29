// To parse this JSON data, do
//
//     final rickyAndMortyCharacterFilter = rickyAndMortyCharacterFilterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RickyAndMortyCharacterFilter rickyAndMortyCharacterFilterFromJson(String str) => RickyAndMortyCharacterFilter.fromJson(json.decode(str));

String rickyAndMortyCharacterFilterToJson(RickyAndMortyCharacterFilter data) => json.encode(data.toJson());

class RickyAndMortyCharacterFilter {
    Info info;
    List<FilterCharacterRickyAndMorty> results;

    RickyAndMortyCharacterFilter({
        required this.info,
        required this.results,
    });

    factory RickyAndMortyCharacterFilter.fromJson(Map<String, dynamic> json) => RickyAndMortyCharacterFilter(
        info: Info.fromJson(json["info"]),
        results: List<FilterCharacterRickyAndMorty>.from(json["results"].map((x) => FilterCharacterRickyAndMorty.fromJson(x))),
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
    dynamic prev;

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

class FilterCharacterRickyAndMorty {
    int id;
    String name;
    Status status;
    Species species;
    Type type;
    Gender gender;
    Location origin;
    Location location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    FilterCharacterRickyAndMorty({
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

    factory FilterCharacterRickyAndMorty.fromJson(Map<String, dynamic> json) => FilterCharacterRickyAndMorty(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: speciesValues.map[json["species"]]!,
        type: typeValues.map[json["type"]]!,
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
        "species": speciesValues.reverse[species],
        "type": typeValues.reverse[type],
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
    MALE
}

final genderValues = EnumValues({
    "Male": Gender.MALE
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

enum Species {
    ALIEN,
    CRONENBERG,
    HUMAN,
    HUMANOID
}

final speciesValues = EnumValues({
    "Alien": Species.ALIEN,
    "Cronenberg": Species.CRONENBERG,
    "Human": Species.HUMAN,
    "Humanoid": Species.HUMANOID
});

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

enum Type {
    EMPTY,
    FISH_PERSON,
    HUMAN_WITH_ANTENNAE,
    ROBOT
}

final typeValues = EnumValues({
    "": Type.EMPTY,
    "Fish-Person": Type.FISH_PERSON,
    "Human with antennae": Type.HUMAN_WITH_ANTENNAE,
    "Robot": Type.ROBOT
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
