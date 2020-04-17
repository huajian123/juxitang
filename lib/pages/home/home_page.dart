import 'package:flutter/material.dart';
import 'package:juxitang/pages/pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages
      ..add(DataAnalysis())
      ..add(ProductCapacityPage())
      ..add(WalletPage())
      ..add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.beenhere),
            title: Text("数据分析"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beenhere),
            title: Text("产品产能"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beenhere),
            title: Text("钱包"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beenhere),
            title: Text("我的"),
          ),
        ],
      ),
    );
  }
}
