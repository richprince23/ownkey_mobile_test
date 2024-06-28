import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(),
          const Expanded(
            child: Column(
              children: [
                Text("Recent searches"),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
