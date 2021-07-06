import 'dart:math';

import 'package:chinafood/app_theme.dart';
import 'package:chinafood/global.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:chinafood/style/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../home_page_theme.dart';



class FoodSentence extends StatefulWidget {
  const FoodSentence({Key key}) : super(key: key);

  //
  // final AnimationController animationController;
  @override
  _FoodSentenceState createState() => _FoodSentenceState();
}

class _FoodSentenceState extends State<FoodSentence>
    with TickerProviderStateMixin {
  // DateTime dateTime= DateTime.now();
  var date = DateTime.now().day;
  var month = DateTime.now().month;
  bool _ready = false;
  var data;
  var count=0;
  var rand=1;
  var id;
  String author;
  String content;
  // 卡叠的尺寸
  Size _cardStackSize;
  void _getrandom() {
    setState(() {
      rand = Random().nextInt(24);
    });
  }

  Future<void> initCards() async {
    // 防止频繁地刷新

    await Future.delayed(Duration(milliseconds: 500));
    // data = await RecommendApi.getRecommand(3);
    // CloudBaseDatabase db = CloudBaseDatabase(core);
    Collection collection = Global.db.collection("sentence");
    collection.get().then((res) {
      setState(() {
        // data = res.data[0];
        author = res.data[rand]['author'];
        content = res.data[rand]['sen'];
        count=res.data[rand]['count'];
        id=res.data[rand]['id'];
      });
      // print(res.data);
    }).catchError((e) => {});
    _ready = true;
    // setState(() {});
  }
  @override
  void initState() {
    _getrandom();
    Future.delayed(Duration.zero, () async {
      await initCards();
    });
    super.initState();
  }
  ///收藏
  ///
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    Collection collection = Global.db.collection("sentence");
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    if(isLiked){
      collection.where({'id':id}).update(
          {'count':count+1}).then((res) {

      }).catchError((e) => {});
      _ready = true;
    }else{
      collection.where({'id':id}).update(
          {'count':count-1}).then((res) {

      }).catchError((e) => {});
      _ready = true;
    }

    return !isLiked;
  }
  // void addAllListData() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: GestureDetector(
        onDoubleTap: () {
          // print("双击事件 ");
          _getrandom();
          initCards();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              // getMainListViewUI(),
              getAppBarUI(),
              SizedBox(
                height: 10,
              ),
              Container(
                child: !_ready
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    // :Text("hello")
                    : Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 20),
                        height: MediaQuery.of(context).size.height * 0.80,
                        width: MediaQuery.of(context).size.width,
                        child: PageCard(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PageCard(BuildContext context) {
    // var size=_cardSize;
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppTheme.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 26,
                color: Theme.of(context).dividerColor,
                offset: Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(
              40,
            ))),
        child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                //装饰
                height: 35,
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 30,
                    height: 3,
                    color: AppTheme.tabBarColorLight,
                  ),
                ),
              ),

              ///日期
              ///
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 0,
                  right: 8,
                ),
                child: Text(
                  "· " + month.toString() + "月" + date.toString() + "日 ·"
                  // "好吃的 ·"+date+"·"
                  ,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "liuti",
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    letterSpacing: -0.2,
                      color: FitnessAppTheme.darkerText,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 10,
              ),

              ///内容
              ///
              Container(
                //内容
                //color: Colors.purple,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  content,
                  //目前数据为空暂时填入范例
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(
                      color: AppTheme.textColorLight,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                      fontFamily: "liuti"),
                ),
              ),

              ///来源
              ///
              Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 10),
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.zero,
                //alignment: Alignment.center,
                child: Text(
                  author,
                  // "你",
                  //暂时代替
                  //widget.data.userName,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: AppTheme.backgroundColorDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "liuti"),
                ),

                // alignment: Alignment.topCenter,
              ),
              Expanded(
                  child: SizedBox(
                height: 60,
                width: 0,
              )),

              ///点赞帮助
              ///
              Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.topCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 38,
                        width: 68,
                        child:
                      LikeButton(
                        likeCount: count,
                        onTap: onLikeButtonTapped,
                        size: 32,
                        circleColor:
                        CircleColor(
                            start: Colors.pinkAccent,
                            end: Colors.pink,),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.amber,
                          dotSecondaryColor: Colors.deepOrange,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite_border,
                            color: isLiked ? Colors.redAccent: FitnessAppTheme.grey,
                          );
                        },
                        countBuilder: (int count, bool isLiked, String text) {
                          var color = isLiked ? Colors.pink : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "love",
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                      ),),
                      Expanded(

                          // padding: const EdgeInsets.only(
                          //   left: 8,
                          //   right: 8,
                          // ),
                          child: SizedBox()),
                      Container(
                        height: 38,
                        width: 38,
                        margin: EdgeInsets.only(right: 20),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  // barrierDismissible: false,
                                  builder: (context) {
                                    return FoodDialog(
                                      "1. 点赞收藏\n\n2. 双击刷新推荐",

                                      // "修复旧版本的bug",
                                    );
                                  });
                            });
                          },
                          child: Center(
                            child: Icon(
                              Icons.help_outline_rounded,
                              color: AppTheme.blue,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ]));
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
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
                          '食物的味道',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "lishu",
                            // fontWeight: FontWeight.bold,
                            fontSize: 25,
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
