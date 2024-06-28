import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/constants.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int? selected;
  final PageController _controller = PageController();

//timer to automatically scroll carousel

  Timer? timer;

  void tick(Timer timer) {
    if (_controller.hasClients) {
      if (_controller.page == 2) {
        _controller.jumpToPage(0);
      } else {
        _controller.nextPage(
            duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    selected = 0;
    timer = Timer.periodic(const Duration(seconds: 5), tick);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                selected = page;
              });
            },
            controller: _controller,
            children: const [
              CarouselItem(
                caption:
                    "Find buyers and renters on Ghana's modern real estate marketplace today",
                imageName: "carousel4.jpg",
              ),
              CarouselItem(
                caption: "Discover. Own. Thrive in Accra",
                imageName: "carousel3.jpg",
              ),
              CarouselItem(
                caption:
                    "A diverse range of properties all nestled in welcoming neighbourhoods",
                imageName: "carousel1.jpg",
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            right: MediaQuery.of(context).size.width * 0.4,
            child: SizedBox(
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  3,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selected = index;
                        _controller.jumpToPage(index);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: selected == index ? priCol : accCol,
                      ),
                      width: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String caption;

  final String imageName;
  // final Function? onTap;

  const CarouselItem({
    super.key,
    required this.caption,
    required this.imageName,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/$imageName",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            // opacity: const AlwaysStoppedAnimation(.6),
          ),
          Opacity(
            opacity: 0.3,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                caption,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
