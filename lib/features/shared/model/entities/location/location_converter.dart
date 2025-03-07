import 'package:freezed_annotation/freezed_annotation.dart';
import 'location.dart';

class LocationConverter
    implements JsonConverter<Location, Map<String, dynamic>> {
  const LocationConverter();

  @override
  Location fromJson(Map<String, dynamic> json) => Location.fromJson(json);

  @override
  Map<String, dynamic> toJson(Location location) => location.toJson();
}
