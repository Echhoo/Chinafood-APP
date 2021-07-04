import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static String userPhone;
  static CloudBaseDatabase db;
  static CloudBaseStorage storage;
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString("userInfo");
  }
}