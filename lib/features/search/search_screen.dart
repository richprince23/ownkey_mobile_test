import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownkey_mobile_test/core/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgCol,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recent searches",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    RecentItem(
                      text: "hotel",
                    ),
                    RecentItem(
                      text: "apartment",
                    ),
                    RecentItem(
                      text: "condo",
                    ),
                    RecentItem(
                      text: "legon",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Filter by type",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var prop in propTypes) PropType(caption: prop),
                    ],
                  ),
                ),
                const Expanded(
                    child: Center(
                  child: Text(
                      "Some more UI elements like featured listings and rencently viewed"),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentItem extends StatelessWidget {
  final String text;
  const RecentItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: accCol,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text));
  }
}

class PropType extends StatelessWidget {
  final String caption;
  const PropType({
    super.key,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: priCol,
        ),
      ),
      child: Text(caption),
    );
  }
}
