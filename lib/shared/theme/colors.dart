import 'package:flutter/material.dart';

abstract class ColorTheme {
  Color get primaryColor;

  Color textPrimary = const Color(0xff373737);

  Color textSecondary = const Color(0xff5B5B5B);

  Color black = const Color(0xff000000);

  Color white = const Color(0xffFFFFFF);

  Color blue = const Color(0xff007AFF);

  Color tluBlueColor = const Color(0xff0623A4);

  Color tluLightBlueColor = const Color(0xff0044FF);

  Color tluRedColor = const Color(0xffF32409);

  Color tluWhiteColor = const Color(0xffF5F5F7);

  Color tluIndigoColor = const Color(0xff000066);

  Color textTerrary = const Color(0xff8E8E8E);

  Color textDisabled = const Color(0xff8D8D8D);

  MaterialColor get swatches;

  Color get primaryButton;

  Color textError = const Color(0xffEB5252);

  Color inputBorder = const Color(0xffA6A6A6);

  Color get focusedInputBorder;

  Color erroredInputBorder = const Color(0xffF64D4D);

  Color placeholderColor = const Color(0xffB2B0B0);

  Color placeholderColorDark = const Color(0xff8E8E8E);

  Color disabledInputBorder = const Color(0xffE0E0E0);

  Color get cursor;

  Color disableIcon = const Color(0xff8D8D8D);

  Color easyColor = const Color(0xff46B150);

  Color mediumColor = const Color(0xffE4D01D);

  Color hardColor = const Color(0xffE4651D);

  Color ligthGrey = const Color(0xffF8F8F8);

  Color divider = const Color(0xffECECEC);

  Color dotIndicator = const Color(0xffE0DDDD);

  Color tagBorder = const Color(0xffECECEC);

  Color green400 = const Color(0xff00875A);

  Color onlineColor = const Color(0xff08BA26);

  Color offlineColor = const Color(0xffB2B0B0);

  Color textWhiteGrey = const Color(0xffD2D2D2);

  Color circleBarBackground = const Color(0xffE7E7E7);

  Color lightBorder = const Color(0xffEEEEEE);

  Color primaryBackground = const Color(0xffF6F8FC);

  Color get activeSlider;

  Color inactiveSlider = const Color(0xffECECEC);

  Color neutralLight = const Color(0xffFAFBFC);

  Color lightPink = const Color(0xffFFE5F2);

  Color dimGrey = const Color(0xffD9D9D9).withOpacity(0.2);

  Color get highlightTab;

  Color unHighlightTab = const Color(0xff8D8D8D);

  Color success = const Color(0xff00875A);

  Color error = const Color(0xffEB5252);

  Color warning = const Color(0xffFFBC11);

  Color good = Colors.green;
}

class LightColorTheme extends ColorTheme {
  @override
  Color get primaryColor => tluBlueColor;

  @override
  Color get primaryButton => tluBlueColor;

  @override
  MaterialColor get swatches => const MaterialColor(0xff0623A4, {
        50: Color(0xffe1e4f4),
        100: Color(0xffb5bce4),
        200: Color(0xff8490d2),
        300: Color(0xff5263c0),
        400: Color(0xff2d41b2),
        500: Color(0xff0623A4),
        600: Color(0xff051f9c),
        700: Color(0xff041a92),
        800: Color(0xff031589),
        900: Color(0xff010c78),
      });

  @override
  Color get activeSlider => tluBlueColor;

  @override
  Color get cursor => tluBlueColor;

  @override
  Color get focusedInputBorder => tluBlueColor;

  @override
  Color get highlightTab => tluBlueColor;
}

class DarkColorTheme extends ColorTheme {
  @override
  Color get primaryColor => tluBlueColor;

  @override
  Color get primaryButton => tluBlueColor;

  @override
  Color get primaryBackground => const Color(0xff212121);

  @override
  MaterialColor get swatches => const MaterialColor(0xff212121, {
        50: Color(0xffFAFAFA),
        100: Color(0xffF5F5F5),
        200: Color(0xffEEEEEE),
        300: Color(0xffE0E0E0),
        400: Color(0xffBDBDBD),
        500: Color(0xff9E9E9E),
        600: Color(0xff757575),
        700: Color(0xff616161),
        800: Color(0xff424242),
        900: Color(0xff212121),
      });

  @override
  Color get activeSlider => tluBlueColor;

  @override
  Color get cursor => tluBlueColor;

  @override
  Color get focusedInputBorder => tluBlueColor;

  @override
  Color get highlightTab => tluBlueColor;
}
