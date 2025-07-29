import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/buttons.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: black,
        title: Text("Bookings", style: AppStyles.styleSemiBold18),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: height * 0.7,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      color: red,
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesMovie1,
                            height: 141,
                            width: 95,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6),
                              Text(
                                "The Tomorrow War",
                                style: AppStyles.styleBold18White,
                              ),

                              Row(
                                children: [
                                  const Icon(
                                        Icons.calendar_month,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 3),
                                  Text(
                                    "May 02, 2024",
                                    style: AppStyles.styleMedium14White,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 1),
                                  const Icon(
                                    FontAwesomeIcons.solidClock,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 4),
                                  Text("Sunday At 09:30", style: AppStyles.styleMedium14White),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.chair_alt_rounded,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        "4 Seats",
                                        style: AppStyles.styleSemiBold11,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.money,
                                        color: white,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "400 \$",
                                        style: AppStyles.styleSemiBold11,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 14),
                              SizedBox(
                                width: 210,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 32,
                                        padding: EdgeInsets.only(
                                          top: 2,
                                          bottom: 2,
                                          right: 4,
                                          left: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(color: white),
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          size: 25,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      flex: 7,
                                      child: SizedBox(
                                        height: 32,
                                        child: CustomButton(
                                          btnClr: red,
                                          txtClr: white,
                                          brdrClr: white,
                                          buttonLabel: 'View QR',
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              Routes.qrScreen,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 6),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -24,
                      top: 52,
                      child: Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
