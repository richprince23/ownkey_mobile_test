import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/page_state.dart';
import 'package:ownkey_mobile_test/features/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PageState()),
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
