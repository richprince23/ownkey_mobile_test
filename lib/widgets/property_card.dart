import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
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
                child: Image.network(
                  property.images![0],
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
                        //TODO: I actually think the data coming from the bathrooms resource should be a number as stated in the meta, but a boolen was specified as the type in the response
                        // AmenityItem(
                        //   value: property.propertyAmenities![3].data?.value,
                        //   icon: getIcon(
                        //       property.propertyAmenities![3].amenity!.name),
                        // ),
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
        ],
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