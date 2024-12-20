import 'package:flutter/material.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColor.black),
      dividerTheme: const DividerThemeData(
        color: AppColor.opposite,
        thickness: 1,
        indent: 10,
        endIndent: 10,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColor.secondary,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: TextStyle(color: AppColor.white),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColor.white),
      dividerTheme: const DividerThemeData(
        color: AppColor.opposite,
        thickness: 1,
        indent: 10,
        endIndent: 10,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColor.secondary,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: TextStyle(color: AppColor.white),
      ),
    );
  }
}
