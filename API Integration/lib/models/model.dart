// To parse this JSON data, do
//
//     final gamerModel = gamerModelFromJson(jsonString);

// ignore_for_file: prefer_conditional_assignment, constant_identifier_names

import 'dart:convert';

List<GamerModel> gamerModelFromJson(String str) =>
    List<GamerModel>.from(json.decode(str).map((x) => GamerModel.fromJson(x)));

String gamerModelToJson(List<GamerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GamerModel {
  GamerModel({
    this.id,
    this.title,
    this.worth,
    this.thumbnail,
    this.image,
    this.description,
    this.instructions,
    this.openGiveawayUrl,
    this.publishedDate,
    this.type,
    this.platforms,
    this.endDate,
    this.users,
    this.status,
    this.gamerModelUrl,
    this.openGiveaway,
  });

  final int? id;
  final String? title;
  final String? worth;
  final String? thumbnail;
  final String? image;
  final String? description;
  final String? instructions;
  final String? openGiveawayUrl;
  final DateTime? publishedDate;
  final Type? type;
  final String? platforms;
  final dynamic endDate;
  final int? users;
  final Status? status;
  final String? gamerModelUrl;
  final String? openGiveaway;

  factory GamerModel.fromJson(Map<String, dynamic> json) => GamerModel(
        id: json['id'],
        title: json['title'],
        worth: json['worth'],
        thumbnail: json['thumbnail'],
        image: json['image'],
        description: json['description'],
        instructions: json['instructions'],
        openGiveawayUrl: json['open_giveaway_url'],
        publishedDate: json['published_date'] == null
            ? null
            : DateTime.parse(json['published_date']),
        type: json['type'] == null ? null : typeValues.map![json['type']],
        platforms: json['platforms'],
        endDate: json['end_date'],
        users: json['users'],
        status:
            json['status'] == null ? null : statusValues.map![json['status']],
        gamerModelUrl: json['gamerModel_url'],
        openGiveaway: json['open_giveaway'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'worth': worth,
        'thumbnail': thumbnail,
        'image': image,
        'description': description,
        'instructions': instructions,
        'open_giveaway_url': openGiveawayUrl,
        'published_date':
            publishedDate == null ? null : publishedDate!.toIso8601String(),
        'type': type == null ? null : typeValues.reverse[type],
        'platforms': platforms,
        'end_date': endDate,
        'users': users,
        'status': status == null ? null : statusValues.reverse[status],
        'gamerModel_url': gamerModelUrl,
        'open_giveaway': openGiveaway,
      };
}

enum EndDateEnum { N_A }

final endDateEnumValues = EnumValues({'N/A': EndDateEnum.N_A});

enum Status { ACTIVE }

final statusValues = EnumValues({'Active': Status.ACTIVE});

enum Type { FULL_GAME, DLC_LOOT, EARLY_ACCESS, OTHER }

final typeValues = EnumValues({
  'DLC & Loot': Type.DLC_LOOT,
  'Early Access': Type.EARLY_ACCESS,
  'Full Game': Type.FULL_GAME,
  'Other': Type.OTHER
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => MapEntry(v, k));
    }
    return reverseMap!;
  }
}
