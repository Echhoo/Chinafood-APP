import 'package:flutter/material.dart';

class RelaxView extends StatelessWidget {
  final AnimationController animationController;

  const RelaxView({Key key, this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _relaxAnimation,
                child: Text(
                  "食物·中国",
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold,fontFamily: "cfkai"),
                ),
              ),
              SlideTransition(
                position: _textAnimation,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "      从手到口，从口到心，中国人延续着对世界和人生特有的感知方式，只要点起炉火，端起碗筷，每个平凡的人，都在某个瞬间，参与创造了舌尖上的非凡史诗。\n"
                        // "      在这9,634,057平方公里的土地上，有无数美食小味等待我们去探索...",
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: _imageAnimation,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 400, maxHeight: 350),
                  child: Image.asset(
                    'assets/introduction/hello.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
