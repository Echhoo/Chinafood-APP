import 'package:chinafood/home_page/home_page_theme.dart';
import 'package:chinafood/home_page/my_diary/meals_list_view.dart';
import 'package:chinafood/home_page/my_diary/water_view.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../app_theme.dart';
import '../global.dart';

class FoodPage extends StatefulWidget {
  var food;
  FoodPage({Key key, this.food});
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> with TickerProviderStateMixin {
  @override
  void initState() {
    // initDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            getPage(),
            // Text(widget.food['name'])
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    return Container(
        height: MediaQuery.of(context).size.height - 110,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: AppTheme.primeColorLight0,
          boxShadow: [
            BoxShadow(
              blurRadius: 35,
              color: Theme.of(context).dividerColor,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.0),
            topRight: Radius.circular(28.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 14 / 10,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  topRight: Radius.circular(14.0),
                ),
                child: Image.network(
                  widget.food['img_url'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              hoverColor: AppTheme.primeColorLight0,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.food['img_url']),
              ),
              title: Text(widget.food['name'],
                  style: TextStyle(fontFamily: "liuti", fontSize: 20)),
              // subtitle: Text(post.author),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 35,
                    color: Theme.of(context).dividerColor,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(32.0)
                ),
              ),
              margin: EdgeInsets.all(6.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                  '?????????' + widget.food['??????'] + '       ?????????' + widget.food['??????'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: "liuti", fontSize: 18)),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 35,
                    color: Theme.of(context).dividerColor,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(32.0)
                ),
              ),
              margin: EdgeInsets.all(6.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                  '?????????' + widget.food['??????'] + '       ?????????' + widget.food['??????'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: "liuti", fontSize: 18)),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.blue.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 35,
                    color: Theme.of(context).dividerColor,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(32.0)
                ),
              ),
              margin: EdgeInsets.only(top:6.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                  '??????',
                  style: TextStyle(color:AppTheme.white,fontFamily: "liuti", fontSize: 18)),
            ),
            Container(
              margin: EdgeInsets.only(left:20.0,right: 20,top:5,bottom: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 30,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: widget.food['??????'].length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28.0),
                          topRight: Radius.circular(28.0),
                        ),
                      ),
                      // color: Colors.white,
                      alignment: Alignment.topCenter,
                      child: Text(widget.food['??????'][index],style: TextStyle(fontFamily: "liuti", fontSize: 18)));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.blue.withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 35,
                    color: Theme.of(context).dividerColor,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(32.0)
                ),
              ),
              margin: EdgeInsets.only(top:6.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                  '??????',
                  style: TextStyle(color:AppTheme.white,fontFamily: "liuti", fontSize: 18)),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.food['??????'].length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28.0),
                            topRight: Radius.circular(28.0),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        height: 30,
                        child: Text(widget.food['??????'][index],style: TextStyle(fontFamily: "liuti", fontSize: 18)));
                  },
                )),

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
                          '?????????',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "liuti",
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
