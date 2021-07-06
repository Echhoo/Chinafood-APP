import 'package:chinafood/home_page/home_page_theme.dart';
import 'package:chinafood/home_page/my_diary/meals_list_view.dart';
import 'package:chinafood/home_page/my_diary/water_view.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:chinafood/eight_food/food_page.dart';
import '../app_theme.dart';
import '../global.dart';

class EightFood extends StatefulWidget {
  @override
  _EightFoodState createState() => _EightFoodState();
}

class _EightFoodState extends State<EightFood> with TickerProviderStateMixin {
  List title = ["川菜", "鲁菜", "湘菜", "徽菜", "苏菜", "浙菜", "粤菜", "闽菜"];
  List foods = [];
  int index = 1; //一级分类下标
  Color textColor = AppTheme.darkerText;
  Collection collection;
  initDatas() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    collection = Global.db.collection("eightfood");
    collection
        .where({'title': "川菜"})
        .get()
        .then((res) {
          setState(() {
            foods = res.data;
          });
        })
        .catchError((e) => {});
  }

  _updateArticles(int i) async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    collection = Global.db.collection("eightfood");
    collection
        .where({'title': title[i]})
        .get()
        .then((res) {
          setState(() {
            foods = res.data;
          });
          // print(res.data.name);
        })
        .catchError((e) => {});
    setState(() {});
  }

  @override
  void initState() {
    initDatas();
    super.initState();
  }

  // Future<bool> getData() async {
  //   await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  //   return true;
  // }
  Widget getRow(int i) {
    //字体颜色
    return new GestureDetector(
      child: new Container(
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.lightGreen)
        // ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        color: index == i ? AppTheme.blue : AppTheme.white,
        child: new Text(title[i],
            style: TextStyle(
                color: index == i ? AppTheme.white : textColor,
                fontFamily: "liuti",
                fontWeight: FontWeight.w500,
                fontSize: 25)),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          textColor = AppTheme.darkerText;
        });
      },
    );
  }

  Widget getChip(int i) {
    _updateArticles(i);
    return
        // AnimationLimiter(
        // child:
        ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            //滑动动画
            verticalOffset: 50.0,
            child: FadeInAnimation(
              //渐隐渐现动画
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodPage(food:foods[index])));
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          child: Image.network(
                            foods[index]['img_url'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        hoverColor: AppTheme.primeColorLight0,
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(foods[index]['img_url']),
                        ),
                        title: Text(foods[index]['name'],
                            style:
                                TextStyle(fontFamily: "liuti", fontSize: 20)),
                        // subtitle: Text(post.author),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                            '口味：' +
                                foods[index]['口味'] +
                                '       烹饪：' +
                                foods[index]['工艺'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontFamily: "liuti", fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //   child: Text(foods[index]['name']),
              //   margin: EdgeInsets.all(5),
              //   color: Theme.of(context).primaryColor,
              //   height: 60,
              // ),
            ),
          ),
        );
      },
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            getAppBarUI(),
            SizedBox(
              height: 20,
            ),
            getMainListViewUI(),
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return Container(
        height: MediaQuery.of(context).size.height - 110,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ///左侧
            ///
            new Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: AppTheme.white,
                  child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: title.length,
                      itemBuilder: (BuildContext context, int position) {
                        // print(position);
                        // return Text(title[position]);
                        return getRow(position);
                      }),
                )),

            ///二级右侧
            ///
            new Expanded(
              flex: 5,
              child: AnimationLimiter(
                // Container(
                //   //height: double.infinity,
                //   alignment: Alignment.topLeft,
                //   padding: const EdgeInsets.all(10),
                //   color: AppTheme.primeColorLight0,
                child: getChip(index), //传入一级分类下标
              ),
            ),
          ],
        ));
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
            color: AppTheme.blue,
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
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32.0)),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: FitnessAppTheme.grey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '八大菜系',
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
