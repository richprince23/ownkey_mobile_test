import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';
import 'package:ownkey_mobile_test/core/page_state.dart';
import 'package:ownkey_mobile_test/widgets/nav_item.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return Container(
      clipBehavior: Clip.antiAlias,
      // margin: pa1,
      // padding: pa1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<PageState>(builder: (context, value, child) {
        return NavigationBar(
          // backgroundColor: cPri.withOpacity(0.5),
          surfaceTintColor: Colors.white,
          elevation: 3,
          selectedIndex: context.watch<PageState>().currentPage,
          height: height * 0.08,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            SizedBox(
              height: height * 0.08,
              child: InkWell(
                // iconSize: 16,
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                    Provider.of<PageState>(context, listen: false).setPage(0);
                  });
                },
                child: value.currentPage == 0
                    ? const NavItem(
                        label: "Explore",
                        icon: Icons.home_filled,
                      )
                    : Icon(
                        Icons.home,
                        color: txtCol,
                        size: 24,
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
              child: InkWell(
                // iconSize: 16,
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                    Provider.of<PageState>(context, listen: false).setPage(1);
                  });
                },
                child: value.currentPage == 1
                    ? const NavItem(
                        label: "Search",
                        icon: Icons.search,
                      )
                    : Icon(
                        Icons.search,
                        color: txtCol,
                        size: 24,
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
              child: InkWell(
                // iconSize: 16,
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                    Provider.of<PageState>(context, listen: false).setPage(2);
                  });
                },
                child: value.currentPage == 2
                    ? const NavItem(
                        label: "Favorites",
                        icon: Icons.favorite,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: txtCol,
                        size: 24,
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
              // width: size.height * 0.06,
              child: InkWell(
                // iconSize: 16,
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                    Provider.of<PageState>(context, listen: false).setPage(3);
                  });
                },
                child: value.currentPage == 3
                    ? const NavItem(
                        label: "Account",
                        icon: Icons.person,
                      )
                    : Icon(
                        Icons.person_outline,
                        color: txtCol,
                        size: 24,
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
