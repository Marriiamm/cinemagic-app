import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';

class QrView extends StatelessWidget {
  const QrView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: black,
          title: Text("Ticket QR", style: AppStyles.styleSemiBold18),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 20, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: height * 0.08,
          ),
          child: Stack(
            children: [
              Container(
                height: height,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: lightBlack,
                ),
                child: Column(
                  children: [
                    Text("Scan This Qr Code", style: AppStyles.styleSemiBold24),
                    SizedBox(height: 10),
                    Text(
                      "Point This Qr code to the Scan Piece",
                      style: AppStyles.styleSemiBold14White,
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: lighterBlack,
                      ),
                      child: Icon(
                        FontAwesomeIcons.qrcode,
                        color: white,
                        size: 180,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      "- - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                      style: AppStyles.styleSemiBold16,
                    ),
                    SizedBox(height: 10),
                    Text("The Tomorrow War", style: AppStyles.styleBold18White),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Full Name", style: AppStyles.styleRegular14),
                        Text("Time", style: AppStyles.styleRegular14),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "The Tomorrow War",
                          style: AppStyles.styleMedium16White,
                        ),
                        Text("09:30", style: AppStyles.styleMedium16White),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date", style: AppStyles.styleRegular14),
                        Text("Seats", style: AppStyles.styleRegular14),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aug 20, 2025",
                          style: AppStyles.styleMedium16White,
                        ),
                        Text("F15, F16", style: AppStyles.styleMedium16White),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -24,
                top: (height - 80) / 2,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Positioned(
                right: -24,
                top: (height - 80) / 2,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
