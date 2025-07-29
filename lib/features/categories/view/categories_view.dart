import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/buttons.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: black,
        title: Text("Categories", style: AppStyles.styleSemiBold18),
      ),
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: red),
                      ),
                      child: Text(
                        "Fantasy",
                        style: AppStyles.styleSemiBold14White,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: height * 0.7,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        //border: Border.all(color: red),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesMovie1,
                            height: 160,
                            width: 100,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Tomorrow War",
                                style: AppStyles.styleBold16White,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Action, Adventure and Sci-Fi ",
                                style: AppStyles.styleRegular14,
                              ),
                              SizedBox(height: 4),
                              Text("2021", style: AppStyles.styleRegular14),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
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
                                      Text(
                                        "9.0",
                                        style: AppStyles.styleRegular11White,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.solidClock,
                                    color: Color(0xffAAAAAA),
                                    size: 12,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    " 2h : 15m",
                                    style: AppStyles.styleRegular11White,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                width: 205,
                                height: 35,
                                child: CustomButton(
                                  buttonLabel: 'View Details',
                                  onTap: (){
                                    Navigator.pushNamed(context, Routes.movieDetailsScreen);
                                  },
                                ),
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
        ),
      ),
    );
  }
}
