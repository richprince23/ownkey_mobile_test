class Attribute {
  String createdAt;
  String updatedAt;
  String slug;
  String name;

  Attribute({
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.name,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'updated_at': updatedAt,
      'slug': slug,
      'name': name,
    };
  }
}
