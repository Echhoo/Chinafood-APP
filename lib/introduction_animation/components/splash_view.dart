import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key key, this.animationController})
      : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _introductionanimation,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 28.0),
              child: Text(
                "中国·味道",
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold,fontFamily: "cfkai"),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              child: Image.asset(
                'assets/introduction/xunwei.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.0,left: 64, right: 64),
              child: Text(
                "食色，性也。\n 中国人对于美食的馋恋，跟文字一样，相辅相成，绵绵不绝。",
                // "爱上中国美食，爱上这些美食背后的这个古老而又年轻的国度。",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "WorkSans",fontSize: 18.0, ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.only(
                    left: 60.0,
                    right: 60.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xff132137),
                    // color:Color.fromRGBO(255, 192, 0,1)
                  ),
                  child: Text(
                    "寻找",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
