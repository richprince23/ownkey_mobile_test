import 'package:ownkey_mobile_test/core/models/amenity.dart';
import 'package:ownkey_mobile_test/core/models/amenity_data.dart';

class PropertyAmenity {
  int id;
  String createdAt;
  Amenity? amenity;
  AmenityData? data;

  PropertyAmenity({
    required this.id,
    required this.createdAt,
    required this.amenity,
    required this.data,
  });

  factory PropertyAmenity.fromJson(Map<String, dynamic> json) {
    return PropertyAmenity(
      id: json['id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      amenity: Amenity.fromJson(json['amenity']),
      data: AmenityData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'amenity': amenity?.toJson(),
      'data': data?.toJson(),
    };
  }
}
