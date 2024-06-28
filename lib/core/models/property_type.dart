class PropertyType {
  String createdAt;
  String updatedAt;
  String slug;
  String name;
  String mainType;

  PropertyType({
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.name,
    required this.mainType,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) {
    return PropertyType(
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      slug: json['slug'] ?? "",
      name: json['name'] ?? "",
      mainType: json['main_type'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'updated_at': updatedAt,
      'slug': slug,
      'name': name,
      'main_type': mainType,
    };
  }
}
