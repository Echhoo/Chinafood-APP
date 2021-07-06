import 'package:chinafood/app_theme.dart';
import 'package:chinafood/home_page/home_page_theme.dart';
import 'package:chinafood/style/flat_button.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriend extends StatefulWidget {
  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  getAppBarUI(),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 16,
                        right: 16),
                    child: Image.asset('assets/images/invite.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '快！邀请ta',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: const Text(
                      '分享给你的朋友吧\n 让他不做最后一个~',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 23),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FindersFlatButton(
                      onPressed: () {
                        Share.share(
                            '来看看app的下载包网站吧 https://github.com/Echhoo/Chinafood-APP',
                            subject: '看看我做了什么！');
                        print('Share Action.');
                      },
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 7,
                        left: 30,
                        right: 30,
                      ),

                      child: Text(
                        '分享',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      // new Text(
                      //   "分享",
                      //   style: new TextStyle(
                      //       fontSize: 18, color: Colors.white),
                      // ),
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

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
          // color:
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 26,
                color: Theme.of(context).dividerColor,
                offset: Offset(0, 4),
              )
            ],
            color: AppTheme.blue.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top * 0.7,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '邀请朋友',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // fontFamily: "",
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.2,
                            color: FitnessAppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
