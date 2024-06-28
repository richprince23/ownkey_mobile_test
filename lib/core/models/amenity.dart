class Amenity {
  String createdAt;
  String updatedAt;
  String slug;
  String name;
  String iconUrl;
  String meta;

  Amenity({
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.name,
    required this.iconUrl,
    required this.meta,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) {
    return Amenity(
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      meta: json['meta'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'updated_at': updatedAt,
      'slug': slug,
      'name': name,
      'icon_url': iconUrl,
      'meta': meta,
    };
  }
}
