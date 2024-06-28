class Location {
  int id;
  String createdAt;
  double latitude;
  double longitude;
  String country;
  String city;
  String state;

  Location({
    required this.id,
    required this.createdAt,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
    required this.state,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      country: json['country'] ?? 'Ghana',
      city: json['city'] ?? 'Accra',
      state: json['state'] ?? 'Greater Accra',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'city': city,
      'state': state,
    };
  }
}
