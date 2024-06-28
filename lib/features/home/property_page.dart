import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';

class PropertyScreen extends StatefulWidget {
  final Property property;
  const PropertyScreen({super.key, required this.property});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  IconData getIcon(String amenity) {
    switch (amenity) {
      case "Bathrooms":
        return Icons.bathroom_outlined;
      case "Bedrooms":
        return Icons.king_bed_outlined;
      case "Parking":
        return Icons.garage;
      case "Pool":
        return Icons.pool;
      case "Gym":
        return Icons.fitness_center;
      case "Security":
        return Icons.security;
      case "Air Conditioning":
        return Icons.ac_unit;
      case "Washing Machine":
        return Icons.local_laundry_service_outlined;
      default:
        return Icons.error;
    }
  }

  int curImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgCol,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: secCol,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            //some stuff here
          },
          child: const Text("Book Now"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.property.images![curImageIndex],
                  width: MediaQuery.of(context).size.width,
                  height: 260,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5)
                        ],
                        stops: const [0.0, 0.7],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: SafeArea(
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder()),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    widget.property.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.property.images!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => setState(() => curImageIndex = index),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          width: 80,
                          height: 80,
                          imageUrl: widget.property.images![index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: bgCol,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description", style: TextStyle(fontSize: 18)),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Text(
                      widget.property.desc!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Price", style: TextStyle(fontSize: 18)),
                  Text(
                    "${widget.property.currency} ${formatCurrency(widget.property.price!)}",
                    style: TextStyle(
                      fontSize: 18,
                      color: secCol,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Location", style: TextStyle(fontSize: 18)),
                  Text(
                    "${widget.property.location?.city ?? widget.property.location?.state ?? 'Accra'}, ${widget.property.location!.country}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Type",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.property.type!.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Featured Amenities',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      ...widget.property.propertyAmenities!
                          .map<Widget>((amenity) {
                        if (amenity.data!.value == null ||
                            amenity.data!.value == false) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(bottom: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.3),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Icon(getIcon(amenity.amenity!.name)),
                              const SizedBox(width: 8.0),
                              Text(
                                '${amenity.amenity!.name} : ${amenity.data!.value}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
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
}
