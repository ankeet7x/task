import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/app/constants/app_constants.dart';

final lightTheme = ThemeData(
  // fontFamily: GoogleFonts,

  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontFamily: AppConstants.ibmFont,
        fontSize: 16.sp,
      ),
      bodyText2: TextStyle(fontFamily: AppConstants.ibmFont, fontSize: 16.sp),
      headline1: TextStyle(fontFamily: AppConstants.ibmFont, fontSize: 22.sp),
      headline2: TextStyle(fontFamily: AppConstants.ibmFont, fontSize: 20.sp)),
);
