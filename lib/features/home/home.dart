import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/api_client.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';
import 'package:ownkey_mobile_test/widgets/error_widget.dart';
import 'package:ownkey_mobile_test/widgets/home_carousel.dart';
import 'package:ownkey_mobile_test/widgets/location_stack.dart';
import 'package:ownkey_mobile_test/widgets/property_card.dart';

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