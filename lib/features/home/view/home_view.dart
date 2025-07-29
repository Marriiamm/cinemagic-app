// ignore_for_file: deprecated_member_use

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';
import '../data/movie_home_item.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  final List<String> kidsList = const [
    Assets.imagesCoco,
    Assets.imagesEncanto,
    Assets.imagesLuca,
    Assets.imagesInsideOut,
    Assets.imagesLuca,
  ];

  final List<String> kidsListInfo = const [
    "COCO",
    "ENCANTO",
    "Luca",
    "INside Out",
    "Luca",
  ];

  final List<String> imgList = const [
    Assets.imagesPoster1,
    Assets.imagesPoster2,
    Assets.imagesPoster3,
    Assets.imagesPoster4,
    Assets.imagesPoster5,
  ];

  final List<String> moviesInfo = const [
    "The Wild Robot",
    "ONWARD",
    "ONWARD",
    "INside Out",
    "COCO",
  ];
  final List<String> releaseDates = const [
    "Releases September 20, 2025",
    "Releases August 6, 2025",
    "Releases October 6, 2025",
    "Releases September 19, 2025",
    "Releases November 22, 2025",
  ];

  List<MovieItem> get carouselItems {
    return List.generate(
      moviesInfo.length,
      (index) => MovieItem(
        imageUrl: imgList[index % imgList.length],
        title: moviesInfo[index],
        releaseDate: releaseDates[index % releaseDates.length],
      ),
    );
  }

  List<MovieItem> get kidsItems {
    return List.generate(
      kidsList.length,
      (index) => MovieItem(
        imageUrl: imgList[index % imgList.length],
        title: moviesInfo[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Hello Mariam", style: AppStyles.styleSemiBold20),
                      const SizedBox(width: 8),
                      const Icon(Icons.handshake, color: red, size: 24),
                    ],
                  ),
                  Text(
                    "Find the movie of your choice",
                    style: AppStyles.styleMedium14Gray,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.asset(
                  Assets.imagesUser,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Coming Soon", style: AppStyles.styleSemiBold14White),
              Row(
                children: [
                  Text("See More", style: AppStyles.styleMedium14),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward_ios, color: red, size: 10),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          CarouselSlider(
            options: CarouselOptions(autoPlay: true, height: 200),
            items:
                carouselItems.map((item) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 140,
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.fill,
                              width: 1000,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(item.title, style: AppStyles.styleSemiBold16),
                          Text(
                            item.releaseDate!,
                            style: AppStyles.styleRegular14,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("OnShow Now", style: AppStyles.styleSemiBold14White),
              Row(
                children: [
                  Text("See All", style: AppStyles.styleMedium14),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward_ios, color: red, size: 10),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 170,
                        child: Image.asset(
                          Assets.imagesPoster,
                          fit: BoxFit.fill,
                          width: 130,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "The Avengers",
                        style: AppStyles.styleSemiBold14White,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("2022", style: AppStyles.styleRegular11White),
                          const SizedBox(width: 18),
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Color(0xffAAAAAA),
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "3.71 M",
                                style: AppStyles.styleRegular11White,
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text("9.0", style: AppStyles.styleRegular11White),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                Image.asset(
                  Assets.imagesAdv,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Monday sale is up to 50% for all Tickets",
                      style: AppStyles.styleBold13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best For Kids", style: AppStyles.styleSemiBold14White),
              Row(
                children: [
                  Text("See All", style: AppStyles.styleMedium14),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward_ios, color: red, size: 10),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                var kidsItem = kidsList[index];
                var kidsListInfoo = kidsListInfo[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 170,
                        child: Image.asset(
                          kidsItem,
                          fit: BoxFit.fill,
                          width: 130,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        kidsListInfoo,
                        style: AppStyles.styleSemiBold14White,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("2022", style: AppStyles.styleRegular11White),
                          const SizedBox(width: 18),
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Color(0xffAAAAAA),
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "3.71 M",
                                style: AppStyles.styleRegular11White,
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text("9.0", style: AppStyles.styleRegular11White),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
