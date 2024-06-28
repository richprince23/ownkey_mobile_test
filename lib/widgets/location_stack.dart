import 'package:flutter/material.dart';

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
