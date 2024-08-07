import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ownkey_mobile_test/core/like_state.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';
import 'package:ownkey_mobile_test/features/home/property_page.dart';
import 'package:provider/provider.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard({
    super.key,
    required this.property,
  });

  IconData getIcon(String amenity) {
    switch (amenity) {
      case "Bathrooms":
        return Icons.bathroom_outlined;
      case "Bedrooms":
        return Icons.king_bed_outlined;
      case "Parking":
        return Icons.garage;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropertyScreen(property: property)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: property.images![0],
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16),
                              Text(
                                " ${property.location?.city ?? property.location?.state}, ${property.location?.country}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          AmenityItem(
                            value: property.propertyAmenities![0].data?.value,
                            icon: getIcon(
                                property.propertyAmenities![0].amenity!.name),
                          ),
                          const SizedBox(width: 10),
                          AmenityItem(
                            value: property.propertyAmenities![1].data?.value,
                            icon: getIcon(
                                property.propertyAmenities![1].amenity!.name),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${property.currency} ${formatCurrency(property.price!)}",
                        style: const TextStyle(
                          fontSize: 18,
                          // color: priCol,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 5,
              top: 5,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  property.leasing!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 5,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "${daysBetween(property.createdAt!)} days ago",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Consumer<LikeSate>(
                builder: (context, value, child) => IconButton(
                  icon: Icon(
                    value.isLiked(property)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    if (value.isLiked(property)) {
                      value.unlikeProperty(property);
                    } else {
                      value.likeProperty(property);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// a simple function to convert raw prices to currency format
  String formatCurrency(int price) {
    return NumberFormat.currency(
      locale: 'en_US',
      // symbol: currency,
    ).format(double.parse(price.toString())).substring(3);
  }

  // a simple function to calculate the number of days between two dates
  int daysBetween(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    int daysElapsed = difference.inDays;

    return daysElapsed;
  }
}

// a simple widget to display the amenities of a property
class AmenityItem extends StatelessWidget {
  const AmenityItem({
    super.key,
    required this.value,
    required this.icon,
  });

  final dynamic value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 5),
        Text("$value")
      ],
    );
  }
}
