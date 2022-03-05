import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/app/constants/app_colors.dart';
import 'package:taskapp/app/constants/app_constants.dart';

final lightTheme = ThemeData(
  // fontFamily: GoogleFonts,
  errorColor: AppColors.errorColor,
  iconTheme: const IconThemeData(color: AppColors.textColor),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontFamily: AppConstants.ibmFont,
        fontSize: 16.sp,
      ),
      bodyText2: TextStyle(
          fontFamily: AppConstants.ibmFont,
          fontSize: 16.sp,
          color: AppColors.textColor),
      headline1: TextStyle(
          fontFamily: AppConstants.ibmFont,
          fontSize: 20.sp,
          color: AppColors.textColor),
      headline2: TextStyle(
          fontFamily: AppConstants.ibmFont,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor)),
);
