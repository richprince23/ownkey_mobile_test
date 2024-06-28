import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownkey_mobile_test/core/api_client.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';
import 'package:ownkey_mobile_test/widgets/error_widget.dart';
import 'package:ownkey_mobile_test/widgets/home_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final propTypes = [
    "House",
    "Apartment",
    "Office",
    "Land",
    "TownHouse",
    "Villa",
    "Hotel",
    "Complex",
    "Lodging",
    "Duplex",
    "Event Space",
    "Single Room",
    "Family House",
    "Condo"
  ];

  final popularLocations = [
    "East Legon",
    "Airport Area",
    "Cantonments",
    "Dzorwulu",
    "Spintex",
    "Osu",
    "Tema",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgCol,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeCarousel(),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: const Text(
                "Popular Locations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => LocationStack(
                    caption: popularLocations[index],
                    image: "estates-0${index + 1}.png",
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: Row(
                children: [
                  const Text(
                    "New Listings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: priCol,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder<List<Property>>(
            future: PropertyService().fetchNewProperties(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CustomErrorWidget(
                      message: snapshot.error.toString().split(":")[1],
                      // onTap: () {
                      //   setState(() {});
                      // },
                    ),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No properties found',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              // If we have data, use SliverList
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  addRepaintBoundaries: true,
                  (context, index) {
                    final property = snapshot.data![index];
                    return PropertyCard(property: property);
                  },
                  childCount: snapshot.data!.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LocationStack extends StatelessWidget {
  final String caption;
  final String image;
  const LocationStack({
    super.key,
    required this.caption,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8),
      // ),
      elevation: 4,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/$image",
            width: 160,
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            width: 160,
            height: 200,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              caption,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class PropType extends StatelessWidget {
//   final String caption;
//   const PropType({
//     super.key,
//     required this.caption,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: priCol,
//         ),
//       ),
//       child: Text(caption),
//     );
//   }
// }

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.network(
            property.images![0],
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
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
                Icon(Icons.location_on, color: priCol, size: 16),
                Text(
                  " ${property.location?.city}, ${property.location?.country}",
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
            Row(
              children: [
                Icon(Icons.king_bed, color: priCol, size: 16),
                Text(property.propertyAmenities![0].data!.value ?? 0)
              ],
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Icon(Icons.bathroom, color: priCol, size: 16),
                Text(property.propertyAmenities![1].data!.value ?? 0)
              ],
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Icon(Icons.park, color: priCol, size: 16),
                Text(property.propertyAmenities![2].data!.value.toString())
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "GHS ${property.price}",
          style: TextStyle(
            fontSize: 16,
            color: priCol,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


 // SliverToBoxAdapter(
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 30, bottom: 10),
          //     child: const Text(
          //       "Find by Property Type",
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         for (var prop in propTypes) PropType(caption: prop),
          //       ],
          //     ),
          //   ),
          // ),