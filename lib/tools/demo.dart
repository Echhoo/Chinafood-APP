import 'package:chinafood/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class SlimyCardDemo extends StatefulWidget {
  @override
  _SlimyCardDemoState createState() => _SlimyCardDemoState();
}

class _SlimyCardDemoState extends State<SlimyCardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
        backgroundColor: Colors.indigo[300].withOpacity(0.8),
        automaticallyImplyLeading: false,
        title: Text("关于我们"),
    ),
    body:StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 70),
              SlimyCard(
                color:Colors.indigo[300],
                topCardWidget: topCardWidget((snapshot.data)
                    ? 'assets/introduction/xunwei.png'
                    : 'assets/three_meals/Moon-Crescent.png'),
                bottomCardWidget: bottomCardWidget(),
              ),
            ],
          );
        }))
    );
  }

  Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          '寻味中国',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Center(
          child: Text(
            '分享好吃的句子，好吃的美食~',
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget bottomCardWidget() {
    return Column(
      children: [
        Text(
          '下载方式：',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Expanded(
          child: Text(
            ' 在这里联系我们 下载app '
            'https://github.com/Echhoo/Chinafood-APP'
            '\n'
            'Google Play上传审核中',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}