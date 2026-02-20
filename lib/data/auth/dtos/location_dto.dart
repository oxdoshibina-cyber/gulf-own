import 'package:gulfownsalesview/domain/auth/model/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  @JsonKey(name: "loactions")
  final List<LocationModelDto> loactions;
  @JsonKey(name: "area")
  final List<dynamic> area;
  @JsonKey(name: "route")
  final List<dynamic> route;

  LocationDto({
    required this.loactions,
    required this.area,
    required this.route,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);

  LocationModel toModel() {
    return LocationModel(
      loactions: loactions.map((e) => e.toModel()).toList(),
      area: area,
      route: route,
    );
  }
}

@JsonSerializable()
class LocationModelDto {
  @JsonKey(name: "gl_id")
  final String glid;
  @JsonKey(name: "gl_name")
  final String glname;

  LocationModelDto({required this.glid, required this.glname});

  factory LocationModelDto.fromJson(Map<String, dynamic> json) =>
      _$LocationModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelDtoToJson(this);

  Location toModel() {
    return Location(glid: glid, glname: glname);
  }
}
