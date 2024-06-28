import 'package:ownkey_mobile_test/core/models/attribute.dart';
import 'package:ownkey_mobile_test/core/models/location.dart';
import 'package:ownkey_mobile_test/core/models/prop_amenity.dart';
import 'package:ownkey_mobile_test/core/models/property_type.dart';

class Property {
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? name;
  int? price;
  String? currency;
  int? discount;
  String? leasing;
  int? securityDeposit;
  String? availableDate;
  bool? availability;
  String? streetAddress;
  String? leaseTermDescription;
  int? leaseDuration;
  PropertyType? type;
  String? desc;
  String? status;
  bool? hideAddress;
  bool? negotiable;
  bool? published;
  List<PropertyAmenity>? propertyAmenities;
  List<Attribute>? attributes;
  Location? location;
  List<String>? images;

  Property({
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.name,
    this.price,
    this.currency,
    this.discount,
    this.leasing,
    this.securityDeposit,
    this.availableDate,
    this.availability,
    this.streetAddress,
    this.leaseTermDescription,
    this.leaseDuration,
    this.type,
    this.desc,
    this.status,
    this.hideAddress,
    this.negotiable,
    this.published,
    this.propertyAmenities,
    this.attributes,
    this.location,
    this.images,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      currency: json['currency'] ?? 'GHS',
      discount: json['discount'] ?? 0,
      leasing: json['leasing'] ?? '',
      securityDeposit: json['securityDeposit'] ?? 0,
      availableDate: json['availableDate'] ?? '',
      availability: json['availability'] ?? false,
      streetAddress: json['streetAddress'] ?? '',
      leaseTermDescription: json['leaseTermDescription'] ?? '',
      leaseDuration: json['leaseDuration'] ?? 0,
      type: json['type'] != null ? PropertyType.fromJson(json['type']) : null,
      desc: json['desc'] ?? '',
      status: json['status'] ?? '',
      hideAddress: json['hideAddress'] ?? false,
      negotiable: json['negotiable'] ?? false,
      published: json['published'] ?? false,
      propertyAmenities: json['property_amenities'] != null
          ? List<PropertyAmenity>.from(json['property_amenities']
              .map((x) => PropertyAmenity.fromJson(x)))
          : null,
      attributes: json['attributes'] != null
          ? List<Attribute>.from(
              json['attributes'].map((x) => Attribute.fromJson(x)))
          : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt ?? '',
      'updated_at': updatedAt ?? '',
      'slug': slug ?? '',
      'name': name ?? '',
      'price': price ?? 0,
      'currency': currency ?? 'GHS',
      'discount': discount ?? 0,
      'leasing': leasing ?? '',
      'securityDeposit': securityDeposit ?? 0,
      'availableDate': availableDate ?? '',
      'availability': availability ?? false,
      'streetAddress': streetAddress ?? '',
      'leaseTermDescription': leaseTermDescription ?? '',
      'leaseDuration': leaseDuration ?? 0,
      'type': type?.toJson() ?? {},
      'desc': desc ?? '',
      'status': status ?? '',
      'hideAddress': hideAddress ?? false,
      'negotiable': negotiable ?? false,
      'published': published ?? false,
      'property_amenities':
          propertyAmenities?.map((e) => e.toJson()).toList() ?? [],
      'attributes': attributes?.map((e) => e.toJson()).toList() ?? [],
      'location': location?.toJson() ?? {},
      'images': images ?? [],
    };
  }
}
