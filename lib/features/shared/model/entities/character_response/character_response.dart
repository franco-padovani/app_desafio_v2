import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_response.freezed.dart';
part 'character_response.g.dart';

@freezed
class CharacterResponse with _$CharacterResponse {
  const factory CharacterResponse({
    required Info info,
    @Default([]) List<Character> results,
  }) = _CharacterResponse;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);
}
