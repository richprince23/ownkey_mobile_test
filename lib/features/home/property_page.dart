import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';

class PropertyScreen extends StatelessWidget {
  final Property property;
  const PropertyScreen({super.key, required this.property});

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  property.images![0],
                  width: MediaQuery.of(context).size.width,
                  height: 260,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.name!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        property.desc!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Price: \$${property.price}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Location: ${property.location}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Type: ${property.type}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Amenities",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: property.propertyAmenities!
                            .map((amenity) => Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      Icon(
                                        getIcon(amenity.amenity!.name),
                                        size: 30,
                                      ),
                                      Text(amenity.data!.value.toString()),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
