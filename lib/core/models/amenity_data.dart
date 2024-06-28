class AmenityData {
  dynamic value;

  AmenityData({
    required this.value,
  });

  factory AmenityData.fromJson(Map<String, dynamic> json) {
    return AmenityData(
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value ?? '',
    };
  }
}
