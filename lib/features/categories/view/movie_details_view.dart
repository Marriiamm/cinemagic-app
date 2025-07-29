// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_splashh/core/utils/constants.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/buttons.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(Assets.imagesMovie1),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 150,
                          width: width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                black,
                                black,
                                black.withOpacity(0.9),
                                black.withOpacity(0.7),
                                black.withOpacity(0.05),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: red.withOpacity(0.7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              "9.0",
                                              style:
                                                  AppStyles
                                                      .styleSemiBold14White,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: red.withOpacity(0.7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.solidClock,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              " 2h : 15m",
                                              style:
                                                  AppStyles
                                                      .styleSemiBold14White,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: red.withOpacity(0.7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "3.71 M",
                                              style:
                                                  AppStyles
                                                      .styleSemiBold14White,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "The Tomorrow War",
                                  style: AppStyles.styleBold20White,
                                ),
                                Text(
                                  "2021  |  Action, Adventure, Time Travel, Adventure, Drama and Sci-Fi ",
                                  style: AppStyles.styleMedium13Gray,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text("Story Line", style: AppStyles.styleBold16White),
                        Text(
                          "A family man travels to the year 2051 to join a global war against a deadly alien species.",
                          style: AppStyles.styleMedium13Gray,
                        ),
                        //SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Director |",
                                style: AppStyles.styleMedium13Gray,
                              ),
                              WidgetSpan(child: SizedBox(width: 6)),
                              TextSpan(
                                text: "Chris McKay",
                                style: AppStyles.styleMedium14White,
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Writer |",
                                style: AppStyles.styleMedium13Gray,
                              ),
                              WidgetSpan(child: SizedBox(width: 6)),
                              TextSpan(
                                text: "Zach Dean",
                                style: AppStyles.styleMedium14White,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("Cast", style: AppStyles.styleBold16White),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                //width: 86,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: red),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image.asset(
                                        Assets.imagesCast,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    Text(
                                      "Chris Pratt",
                                      style: AppStyles.styleRegular11White,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  buttonLabel: 'View Trailer',
                                  onTap: () async {
                                    final Uri launchUri = Uri(
                                      scheme: 'https',
                                      host: 'www.youtube.com',
                                      path: '/watch',
                                      queryParameters: {
                                        'v':
                                            'https://www.youtube.com/watch?v=2o_NCvnpQ58', // Replace '3' with the actual YouTube video ID you want to open
                                      },
                                    );
                                    await launchUrl(
                                      launchUri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: CustomButton(
                                  buttonLabel: 'Book Ticket',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.seatsScreen,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
