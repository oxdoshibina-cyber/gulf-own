import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final List<Location> loactions;
  final List<dynamic> area;
  final List<dynamic> route;

  const LocationModel({
    required this.loactions,
    required this.area,
    required this.route,
  });

  @override
  List<Object?> get props => [loactions, area, route];

  factory LocationModel.fromMap(Map<String, dynamic> json) {
    return LocationModel(
      loactions: (json['loactions'] as List<dynamic>?)
              ?.map((e) => Location.fromMap(e))
              .toList() ??
          [],
      area: json['area'] ?? [],
      route: json['route'] ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "loactions": loactions.map((e) => e.toMap()).toList(),
      "area": area,
      "route": route,
    };
  }
}

class Location extends Equatable {
  final String glid;
  final String glname;

  const Location({required this.glid, required this.glname});

  @override
  List<Object?> get props => [glid, glname];

  factory Location.fromMap(Map<String, dynamic> json) {
    return Location(
      glid: json['gl_id'] ?? '',
      glname: json['gl_name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {"gl_id": glid, "gl_name": glname};
  }
}
