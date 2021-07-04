

import 'dart:ui';

import 'package:chinafood/home_page/home_page_home_screen.dart';
import 'package:chinafood/home_page/sentence/food_sentence.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chinafood/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:chinafood/global.dart';
import 'package:chinafood/navigation_home_screen.dart';
import 'package:chinafood/introduction_animation/introduction_animation_screen.dart';

void main() async {
  // 初始化 CloudBase

  CloudBaseCore core = CloudBaseCore.init({
    'env': 'env-5gsr3xqnc0d60a71',
    //a5667983306ceaaf135b634e38b9b125
    // 填写您的移动应用安全来源凭证
    // 生成凭证的应用标识必须是 Android 包名或者 iOS BundleID
    'appAccess': {
      // 凭证
      'key': 'a5667983306ceaaf135b634e38b9b125',
      // 版本
      'version': '1'
    },
  });
  // Global.storage = CloudBaseStorage(core);

  CloudBaseStorage storage = CloudBaseStorage(core);
  Global.storage=storage;
  WidgetsFlutterBinding.ensureInitialized();

  CloudBaseAuth auth = CloudBaseAuth(core);
  CloudBaseAuthState authState = await auth.getAuthState();
  print(authState);
  await auth.signInAnonymously().then((success) {
    // 登录成功
    print("登录cloudbase成功");
  }).catchError((err) {
    // 登录失败
    print("登录失败");
    print('收到error********** $err');
  });
  if(window.physicalSize.isEmpty){
    window.onMetricsChanged = (){
      //在回调中，size仍然有可能是0
      if(!window.physicalSize.isEmpty){
        window.onMetricsChanged = null;
        runApp(MyApp());
      }
    };
  } else{
    //如果size非0，则直接runApp
    runApp(MyApp());
  }

}

class MyApp extends StatefulWidget {

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _loginState;
  // SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _validateLogin();
    // print(_loginState);
  }
  @override
  Widget build(BuildContext context) {

    _validateLogin();
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      // home: IntroductionAnimationScreen(),
      home: _loginState == 1
          ? NavigationHomeScreen() : IntroductionAnimationScreen(), // 欢迎动画
    );
  }

  Future _validateLogin() async {
    // 调用失败
    Future<dynamic> future = Future(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString("userPhone");
    });
    future.then((val) {
      if (val == null) {
        setState(() {
          _loginState = 0;
        });
        // print("没有登录");
      } else {
        // print("已经登陆");
        setState(() {
          _loginState = 1;
          Global.userPhone=val;
        });
      }
    }).catchError((_) {
      print("catchError");
    });
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
