import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';

class HomeCardItem extends StatelessWidget {
  final String caption;
  final IconData icon;
  // final String? route;
  // final Function? onTap;

  const HomeCardItem({
    super.key,
    required this.caption,
    required this.icon,
    // this.onTap,
  }) : assert(caption != "", icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 10,
      decoration: BoxDecoration(
        color: bgCol,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: accCol.withOpacity(0),
            blurRadius: 1,
            spreadRadius: 0.3,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 10),
          Text(caption),
        ],
      ),
    );
  }
}
