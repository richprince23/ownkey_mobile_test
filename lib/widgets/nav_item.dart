import 'package:flutter/material.dart';

import 'package:ownkey_mobile_test/core/constants.dart';

class NavItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const NavItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        // color: kmainCol,
        // borderRadius: BorderRadius.circular(20),
        border: Border(
          bottom: BorderSide(color: priCol, width: 4),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: priCol,
            size: 28,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
