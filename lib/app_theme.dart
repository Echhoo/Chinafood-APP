import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  /// 主题色 米色
  ///
  ///
  static const Color primeColorLight0= Color(0xffF7EBE1);
  /// 第一主题色, 与 [FindersColors.purple] 同色
  /// 颜色编码（十六进制）: `#6963FE`
  static const Color primeColorLight1 = Color(0xFF6963FE);

  /// 第二主题色, 与 [FindersColors.blue] 同色
  /// 颜色编码（十六进制）: `#7CA0FC`
  static const Color primeColorLight2 = Color(0xFF7CA0FC);

  /// 第三主题色, 与 [FindersColors.pink] 同色
  /// 颜色编码（十六进制）: `#E593D6`
  static const Color primeColorLight3 = Color(0xFFE593D6);
  // 第四主题色, 与 [FindersColors.yellow] 同色
  /// 颜色编码（十六进制）: `#FFF1A1`
  static const Color primeColorLight4 = Color(0xFFFFF1A1);

  /// 第五主题色，与 [FindersColors.light] 同色，用作浅色模式背景色
  /// 颜色编码（十六进制）: `#F1EEFE`
  static const Color primeColorLight5 = Color(0xFFF1EEFE);

  /// 目前tabBar的颜色，可能会并入primeColors
  static const Color tabBarColorLight = Color(0xFFE4E5FD);
  static const Color tabBarColorDark = Color(0xFF34315A);

  /// 正文、Dialog 提示等在**浅色模式**中使用的字体颜色
  static const Color textColorLight = Color(0xFF1C1C1C);
  static const Color textColorDark = Color(0xFFF7F8FA);

  static const Color secondaryTextColorLight = Color(0xFF636363);

  /// 次要文字、提示文字在**浅色模式**下使用的颜色，常用于提示与个性签名中
  static const Color hintTextColorLight = Color(0xFF999999);

  /// 禁用组件的颜色，一般用于无法点击的组件
  static const Color disableColorLight = Color(0x99999999);
  static const Color disableColorDark = Color(0xFF636363);

  /// 高亮文字颜色，**浅色模式**，常用于如用户名、选中项等
  static const Color highlightTextColorLight = Color(0xFF453EA0);
  static const Color highlightTextColorDark = Color(0xFF6963FE);


  static const Color secondaryButtonColorLight = Color(0xFFD2D0FF);
  static const Color secondaryButtonColorDark = Color(0xFF484667);

  /// 浅色模式背景色，**极有可能被更改**
  static const Color backgroundColorLight = Color(0xFFF4F4F4);

  /// 暗色模式背景色
  static const Color backgroundColorDark = Color(0xFF161616);
  static const Color dialogBackgroundColorDark = Color(0xFF272727);

  /// 纯黑色
  static const Color black = Color(0xFF000000);

  static const Color transparent = Color(0x00000000);

  // 分割线 浅灰色
  static const Color dividerColorLight = Color(0xFFF3F3F3);
  static const Color dividerColorDark = Color(0xFF181818);

  // 输入文本框
  static const Color textfieldFillColorLight = Color(0xFFF7F8FA);
  static const Color textfieldFillColorDark = Color(0xFF484667);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

}
