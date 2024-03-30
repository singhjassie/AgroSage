
import 'package:agrosage/widgets/video_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VideoCarouselSlider extends StatefulWidget {
  const VideoCarouselSlider({super.key});

  @override
  State<VideoCarouselSlider> createState() => _VideoCarouselSliderState();
}

class _VideoCarouselSliderState extends State<VideoCarouselSlider> {
  List videoList = [
    {"id": 1, "url": 'https://www.youtube.com/watch?v=JeU_EYFH1Jk'},
    {"id": 2, "url": 'https://www.youtube.com/watch?v=OzGudoy7keA'},
    {"id": 3, "url": 'https://www.youtube.com/watch?v=r_YGlKihHtk'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Stack(
          children: [
            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                // print(currentIndex);
              },
              child: CarouselSlider(
                items: videoList
                    .map(
                      (item) => VideoCard(title: 'Title', url: item['url']),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: false,
                  aspectRatio: 3/2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: videoList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]);
  }
}