import 'package:chinafood/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'demo.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
          body: SlimyCardDemo()
        ),
      ),
    );
  }
}
