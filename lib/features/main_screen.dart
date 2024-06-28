import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/page_state.dart';
import 'package:ownkey_mobile_test/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgCol,
      appBar: AppBar(
        title: const Text('Hi Richard!'),
        centerTitle: false,
      ),
      drawer: Drawer(
        backgroundColor: bgCol,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  Text(
                    'Richard Kweku Aikins',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text('richardkns@gmail.com',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            DrawerListItem(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                //some stuff here
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icon: Icons.payment,
              title: 'Payments',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icon: Icons.list_alt,
              title: 'Bookings',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icon: Icons.favorite,
              title: 'Favorites',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icon: Icons.person_2,
              title: 'Find Agents',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: priCol),
            // Assuming that the user is logged in
            DrawerListItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                //some stuff here
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(bottom: 0),
        child: Consumer<PageState>(
          builder: (context, value, child) {
            return kMainPages[value.currentPage];
          },
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(children: [
          Icon(
            icon,
            color: priCol,
          ),
          const SizedBox(width: 10),
          Text(title),
        ]),
      ),
    );
  }
}
