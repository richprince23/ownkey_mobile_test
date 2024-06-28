import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';

class HostelTypeChip extends StatelessWidget {
  const HostelTypeChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InputChip(
        label: Text(label),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : priCol,
        ),
        elevation: 0,
      ),
    );
  }
}
