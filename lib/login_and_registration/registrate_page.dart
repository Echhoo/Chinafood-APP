// import 'package:imd_app/utils/shared_preferences_util.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart' as DB;
import 'package:chinafood/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:chinafood/style/dialog.dart';
import 'package:chinafood/style/flat_button.dart';
import 'package:chinafood/login_and_registration/login_page.dart';

// void main() async {
//
// }
class RegistrationPage extends StatefulWidget {
  final bool isLogin;
  final FocusNode phoneFocusNode;
  final FocusNode verCodeFocusNode;

  const RegistrationPage({
    Key key,
    this.isLogin = true,
    this.phoneFocusNode,
    this.verCodeFocusNode,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  bool _phoneNumberVerified = false;

  String _phoneNumber = "";
  String _verificationCode = "";
  String _name = "";

  // 验证码
  String _verCodeButtonText = "获取验证码";
  int _countdownNum = 59;
  var _countdownTimer;
  var _isreg = false;

  String _userMessage = "";

  @override
  void dispose() {
    _countdownTimer = null;
    super.dispose();
  }

  ///判断是否符合规则
  ///
  int validationJudge() {
    RegExp phoneReg = new RegExp(r'^\d{11}$');
    RegExp pwReg = new RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,32}$');
    if (!phoneReg.hasMatch(_phoneNumber)) {
      return 1;
    }
    if (!pwReg.hasMatch(_verificationCode)) {
      return 2;
    }
    if (_name.length==0) {
      return 3;
    }
    return 0;
  }

  /// 实现登录
  ///
  void _registrationResponse() async {
    CloudBaseCore core = CloudBaseCore.init({
      'env': 'env-5gsr3xqnc0d60a71',
    });

    DB.CloudBaseDatabase db = DB.CloudBaseDatabase(core);
    db
        .collection("user")
        .where({
          "phone": _phoneNumber,
        })
        .count()
        .then((res) {
              var total=res.total;
              if(total!=0){
                setState(() {
                  _userMessage = "很抱歉！该手机号已被注册";
                  // _isreg = true;
                });
              }else{
                db.collection('user').add({
                  'name': _name,
                  'phone': _phoneNumber,
                  'password': _verificationCode,
                  'img_url':"assets/introduction/asset.png"
                }).then((res) {
                  print("注册成功success");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }).catchError((e) {
                  print('收到error********** $e');
                  _userMessage = "注册失败";
                });
              }
            })
        .catchError((e) {
            // print("没有手机号");
        });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppTheme.backgroundColorDark
          : AppTheme.white,
      body: Container(
        color: AppTheme.primeColorLight0,
        child: SafeArea(
          child: new SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //column的次轴为水平方向
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Center(
                    child: Container(
                      width: 266,
                      child: Column(
                        children: [
                          Container(
                            //margin:EdgeInsets.only(top: 0,left: 0),
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                // 使用LinearGradient但是调不出好颜色
                                return LinearGradient(
                                  colors: <Color>[
                                    // Color.fromRGBO(209, 166, 204, 1),
                                    // Color.fromRGBO(175, 158, 227, 1)
                                    Color.fromRGBO(255, 192, 0, 1),
                                    Colors.amber,
                                    // Color.fromRGBO(255, 192, 0, 1),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcATop,
                              child: Text(
                                "注册账户",
                                //未定义字体
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 100),
                            child: RichText(
                              text: TextSpan(
                                  text: " *点击下一步代表你已\n   阅读并同意",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(153, 153, 153, 1)),
                                  children: [
                                    TextSpan(
                                        text: "服务协议",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            //点击事件
                                          }),
                                    TextSpan(
                                      text: "和",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1)),
                                    ),
                                    TextSpan(
                                        text: "隐私协议",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            //点击事件
                                          }),
                                  ]),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    // height: 265,
                                    child: Form(
                                        key: _formKey,
                                        child: Center(
                                          child: Container(
                                            width: 266,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Container(
                                                    width: 270,
                                                    height: 37,
                                                    margin: EdgeInsets.only(
                                                        bottom: 25),
                                                    child: TextFormField(
                                                      focusNode:
                                                      widget.phoneFocusNode,
                                                      decoration:
                                                      InputDecoration(
                                                        hintText: "请输入昵称",
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          /*边角*/
                                                          borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                                20), //边角为30
                                                          ),
                                                          borderSide:
                                                          BorderSide(
                                                            color: Colors
                                                                .black, //边线颜色为黄色
                                                            width: 2, //边线宽度为2
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .all(
                                                              Radius.circular(
                                                                  20), //边角为30
                                                            ),
                                                            borderSide:
                                                            BorderSide(
                                                              color: Colors
                                                                  .amber, //边框颜色为绿色
                                                              width:
                                                              2, //宽度为5
                                                            )),
                                                        contentPadding:
                                                        EdgeInsets
                                                            .symmetric(
                                                          horizontal: 20,
                                                          vertical: 8,
                                                        ),
                                                        // border:   OutlinedBorder,
                                                      ),
                                                      keyboardType:
                                                      TextInputType.text,
                                                      // onEditingComplete: () {
                                                      //   if (_phoneNumberVerified) {
                                                      //     FocusScope.of(context)
                                                      //         .requestFocus(widget
                                                      //         .verCodeFocusNode);
                                                      //   }
                                                      // },
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _name = value;
                                                        });
                                                      },
                                                      onSaved: (value) {
                                                        this._name = value;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    width: 270,
                                                    height: 37,
                                                    margin: EdgeInsets.only(
                                                        bottom: 25),
                                                    child: TextFormField(
                                                      focusNode:
                                                          widget.phoneFocusNode,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "请输入手机号",
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          /*边角*/
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                20), //边角为30
                                                          ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .black, //边线颜色为黄色
                                                            width: 2, //边线宽度为2
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      20), //边角为30
                                                                ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .amber, //边框颜色为绿色
                                                                  width:
                                                                      2, //宽度为5
                                                                )),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                          vertical: 8,
                                                        ),
                                                        // border:   OutlinedBorder,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onEditingComplete: () {
                                                        if (_phoneNumberVerified) {
                                                          FocusScope.of(context)
                                                              .requestFocus(widget
                                                                  .verCodeFocusNode);
                                                        }
                                                      },
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                      onSaved: (value) {
                                                        this._phoneNumber =
                                                            value;
                                                      },
                                                      onChanged: (value) {
                                                        RegExp phoneReg = RegExp(
                                                            r'^1[3-9]\d{9}$');
                                                        if (phoneReg
                                                            .hasMatch(value)) {
                                                          setState(() {
                                                            _phoneNumber =
                                                                value;
                                                            _phoneNumberVerified =
                                                                true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _phoneNumberVerified =
                                                                false;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    width: 270,
                                                    height: 37,
                                                    child: TextFormField(
                                                      focusNode: widget
                                                          .verCodeFocusNode,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "请输入密码 ",
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          /*边角*/
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                20), //边角为30
                                                          ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .black, //边线颜色为黄色
                                                            width: 2, //边线宽度为2
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      20), //边角为30
                                                                ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .amber, //边框颜色为绿色
                                                                  width:
                                                                      2, //宽度为5
                                                                )),
                                                        suffixIcon: Container(
                                                          width: 123,
                                                          height: 37,
                                                          // child: buildGetVerificationCodeButton(),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                          vertical: 8,
                                                        ),
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _verificationCode =
                                                              value;
                                                        });
                                                      },
                                                      onSaved: (value) {
                                                        this._verificationCode =
                                                            value;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    _userMessage,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFE593D6),
                                                        fontSize: 12),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(height: 93),
                                  FindersFlatButton(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      bottom: 7,
                                      left: 30,
                                      right: 30,
                                    ),
                                    child: new Text(
                                      "立即注册",
                                      style: new TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      // _registerFormKey.currentState.save();
                                      switch (validationJudge()) {
                                        case 1:
                                          showDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (context) {
                                                return FoodDialog(
                                                    "请输入正确格式的手机号码");
                                              });
                                          return;
                                        case 2:
                                          showDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (context) {
                                                return FoodDialog(
                                                    "密码长度不小于 8 位，不大于 32 位，需要包含字母和数字。");
                                              });
                                          return;
                                        case 3:
                                          showDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (context) {
                                                return FoodDialog(
                                                    "请输入正确格式的昵称");
                                              });
                                          return;
                                        default:
                                          _registrationResponse();
                                          return;
                                        //     .then((loginState) => {
                                        //   // 登录成功
                                        // });
                                        //测试填加
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             NavigationHomeScreen()));
                                      }
                                    },
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
