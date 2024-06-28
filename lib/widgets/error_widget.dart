import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final Function? onTap;
  const CustomErrorWidget({super.key, required this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: priCol,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: secCol,
          ),
          const SizedBox(height: 30),
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          onTap != null
              ? ElevatedButton(
                  onPressed: () {
                    onTap;
                  },
                  child: const Text("Retry"),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
