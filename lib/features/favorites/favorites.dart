import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/like_state.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';
import 'package:ownkey_mobile_test/features/home/property_page.dart';
import 'package:ownkey_mobile_test/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgCol,
        body: Column(
          children: [
            const Text("Favorites Listings"),
            Expanded(
              child: FutureBuilder<List<Property>>(
                  future: Provider.of<LikeSate>(context).getLikedProperties(),
                  builder: (context, AsyncSnapshot<List<Property>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: CustomErrorWidget(
                          message: snapshot.error.toString().split(":")[1],
                          // onTap: () {
                          //   setState(() {});
                          // },
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("You have not liked any property yet"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final property = snapshot.data![index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PropertyScreen(
                                  property: property,
                                ),
                              ),
                            );
                          },
                          tileColor: Colors.white,
                          title: Text(property.name!),
                          subtitle: Text(
                              "Location: ${property.location?.city ?? property.location?.state ?? property.location?.country}"),
                        );
                      },
                    );
                  }),
            ),
          ],
        ));
  }
}
