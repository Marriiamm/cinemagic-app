import 'package:flutter/material.dart';

double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 400;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 700;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1000;



double getResponsiveFontSize (BuildContext context, {required double fontSize}){
  double scaleFactor= getScaleFactor(context);
  double responsiveFontSize = fontSize* scaleFactor;

  double lowerLimit = fontSize *.7;
  double upperLimit = fontSize *1;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor (context){
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth =dispatcher.views.first.physicalSize.width;
  // var deviceRatio = dispatcher.views.first.devicePixelRatio;
  // double width =physicalWidth/deviceRatio;
  double width =MediaQuery.sizeOf(context).width;
   if (width >700 && width <1300){
    return width/ 1000;
  }else{
    return width/1900;
  }
}//fontSize: getResponsiveFontSize(context,fontSize: 30)