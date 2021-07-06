import 'package:chinafood/app_theme.dart';
import 'package:chinafood/home_page/home_page_theme.dart';
import 'package:chinafood/style/dialog.dart';
import 'package:chinafood/style/flat_button.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
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
                    child: Image.asset('assets/images/feedback.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '你的反馈',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: const Text(
                      '给我们你的建议吧~',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _buildComposer(),
                  SizedBox(height: 23),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                            child: FindersFlatButton(
                              onPressed: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  showDialog(
                                      context: context,
                                      // barrierDismissible: false,
                                      builder: (context) {
                                        return FoodDialog(
                                          "发送成功\n我们会在近期给你反馈~",

                                          // "修复旧版本的bug",
                                        );
                                      });
                                });
                              },
                              padding: EdgeInsets.only(
                                top: 5,
                                bottom: 7,
                                left: 30,
                                right: 30,
                              ),
                              child: new Text(
                                "意见反馈",
                                style: new TextStyle(
                                    fontSize: 18, color: Colors.white),
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
                          '提些意见',
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
  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: AppTheme.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {},
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontSize: 16,
                  color: AppTheme.dark_grey,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '填写你的意见...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
