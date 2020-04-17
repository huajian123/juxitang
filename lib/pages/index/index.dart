import 'package:flutter/material.dart';
import 'package:juxitang/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juxitang/pages/login_page/login.dart';
import 'package:juxitang/pages/pages.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1294, allowFontScaling: true);
    return Global.isFirstOpen == true
        ? Scaffold(
            body: IntroScreen(),
          )
        : Global.isOfflineLogin == true ? Text("业务页面") : Login();
  }
}
