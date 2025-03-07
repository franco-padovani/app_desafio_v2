import 'package:app_desafio_v2/features/shared/model/entities/location/location_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app_desafio_v2/features/shared/model/entities/location/location.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    @LocationConverter() required Location origin,
    @LocationConverter() required Location location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
