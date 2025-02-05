import 'package:baseproject/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Pretendard",
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    surfaceTintColor: Colors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        side: BorderSide(
          color: AppColors.BORDER_COLOR,
        ),
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 15),
        minimumSize: Size(64, 40)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 12.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Color(0xffd4d4d4),
        width: 1.0,
      ),
    ),
    outlineBorder: BorderSide(
      color: AppColors.BORDER_COLOR,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.BORDER_COLOR,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: AppColors.BORDER_COLOR,
          width: 1.0,
        )),
    hintStyle: TextStyle(
      fontSize: 15,
      color: AppColors.BORDER_COLOR,
      fontWeight: FontWeight.w500,
    ),
  ),
);
