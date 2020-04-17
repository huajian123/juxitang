import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juxitang/common/entitys/entitys.dart';
import 'package:juxitang/common/entitys/project.dart';
import 'package:juxitang/common/routers/application.dart';
import 'package:juxitang/common/utils/color_util.dart';

import 'package:juxitang/common/utils/screen.dart';

import 'dart:async';

import 'package:juxitang/common/widgets/my_tab_indicator.dart';

final List<ProjectEntity> projectList = [
  ProjectEntity(title: "原油（布伦特）", num: 56.34, changeNum: 10.00, isAdd: true),
  ProjectEntity(title: "丙烯", num: 382.5, changeNum: 20.00, isAdd: true),
  ProjectEntity(title: "丙烷", num: 6150, changeNum: 12.50, isAdd: false),
  ProjectEntity(title: "拉丝", num: 6800, changeNum: 19.80, isAdd: true),
  ProjectEntity(title: "纤维", num: 7350, changeNum: 13.40, isAdd: true),
  ProjectEntity(title: "注塑", num: 6900, changeNum: 19.12, isAdd: false),
];

class DataAnalysis extends StatefulWidget {
  @override
  _DataAnalysisState createState() => _DataAnalysisState();
}

class _DataAnalysisState extends State<DataAnalysis>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["检修（600万吨）", "正常（21000万吨）"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget _buildTime(context) {
    return Container(
      padding: EdgeInsets.only(
        left: duSetWidth(41),
        right: duSetWidth(30),
        top: duSetHeight(30),
        bottom: duSetHeight(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "数据统计截至 2020.3.20 09:00",
            style: TextStyle(
              color: ColorsUtil.hexColor(0x999999),
              fontSize: duSetFontSize(24),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Baseline(
                baseline: duSetHeight(32),
                baselineType: TextBaseline.alphabetic,
                child: Icon(
                  Icons.error_outline,
                  color: Theme.of(context).primaryColor,
                  size: duSetFontSize(28),
                ),
              ),
              SizedBox(
                width: duSetWidth(5),
              ),
              Text(
                "数据说明",
                style: TextStyle(
                    textBaseline: TextBaseline.ideographic,
                    color: Theme.of(context).primaryColor,
                    fontSize: duSetFontSize(24)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductItem(ProjectEntity item) {
    return Column(
      children: <Widget>[
        Text(
          item.title,
          style: TextStyle(
              color: ColorsUtil.hexColor(0x222222),
              fontSize: duSetFontSize(24)),
        ),
        SizedBox(
          height: duSetHeight(5.0),
        ),
        Text(
          item.num.toString(),
          style: TextStyle(
              color: ColorsUtil.hexColor(0x222222),
              fontSize: duSetFontSize(44)),
        ),
        SizedBox(
          height: duSetHeight(5.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "较昨日",
              style: TextStyle(color: ColorsUtil.hexColor(0x787878)),
            ),
            SizedBox(
              width: duSetWidth(10),
            ),
            Visibility(
              visible: item.isAdd,
              child: Text(
                "+" + item.changeNum.toString(),
                style: TextStyle(color: ColorsUtil.hexColor(0xF15A4B)),
              ),
            ),
            Visibility(
              visible: !item.isAdd,
              child: Text(
                "-" + item.changeNum.toString(),
                style: TextStyle(color: ColorsUtil.hexColor(0x29AB91)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProduct() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
          mainAxisSpacing: 10,
          // crossAxisSpacing: 10,
        ),
        itemCount: projectList.length,
        itemBuilder: (context, index) {
          return _buildProductItem(projectList[index]);
        });
  }

  Widget _buildTabItem(String name, path, context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Application.router
              .navigateTo(context, path, transition: TransitionType.cupertino);
        },
        child: Container(
          height: duSetHeight(96),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: ColorsUtil.hexColor(0xE6E6E6)),
              bottom:
                  BorderSide(width: 1, color: ColorsUtil.hexColor(0xE6E6E6)),
              left: BorderSide(width: 1, color: ColorsUtil.hexColor(0xE6E6E6)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    color: ColorsUtil.hexColor(0x222222),
                    fontSize: duSetFontSize(28)),
              ),
              Baseline(
                baseline: duSetHeight(40),
                baselineType: TextBaseline.alphabetic,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).primaryColor,
                  size: duSetFontSize(35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(context) {
    return Container(
      height: duSetHeight(86),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildTabItem("价格模块", "pricePage", context),
          _buildTabItem("产能产量", "pricePage", context),
          _buildTabItem("产业链现金流", "pricePage", context),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      width: double.infinity,
     /* child: AmapView(
        // 中心点坐标 (可选)
        centerCoordinate: LatLng(32.039458, 118.866218),
        zoomLevel: 19,
        showZoomControl: false,
        *//*     // 地图类型 (可选)
        mapType: MapType.Standard,
        // 是否显示缩放控件 (可选)
        showZoomControl: true,
        // 是否显示指南针控件 (可选)
        showCompass: true,
        // 是否显示比例尺控件 (可选)
        showScaleControl: true,
        // 是否使能缩放手势 (可选)
        zoomGesturesEnabled: true,
        // 是否使能滚动手势 (可选)
        scrollGesturesEnabled: true,
        // 是否使能旋转手势 (可选)
        rotateGestureEnabled: true,
        // 是否使能倾斜手势 (可选)
        tiltGestureEnabled: true,
        // 缩放级别 (可选)
        zoomLevel: 10,
        // 中心点坐标 (可选)
        centerCoordinate: LatLng(39, 116),
        // 标记 (可选)
        markers: <MarkerOption>[],
        // 标识点击回调 (可选)
        onMarkerClick: (Marker marker) {},
        // 地图点击回调 (可选)
        onMapClick: (LatLng coord) {},
        // 地图拖动回调 (可选)
        onMapDrag: (MapDrag drag) {},
        // 地图创建完成回调 (可选)
        onMapCreated: (controller) async {
          // requestPermission是权限请求方法, 需要你自己实现
          // 如果不知道怎么处理, 可以参考example工程的实现, example过程依赖了`permission_handler`插件.
          if (await requestPermission()) {
            await controller.showMyLocation(true);
          }
        },*//*
      ),*/
      child: Text("地图"),
    );
  }

  Widget _buildCardTab() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: duSetHeight(75),
          child: Center(
            child: TabBar(
                controller: _tabController,
                labelColor: ColorsUtil.hexColor(0xDB3535),
                indicatorColor: ColorsUtil.hexColor(0xDB3535),
                unselectedLabelColor: ColorsUtil.hexColor(0x222222),
                indicatorWeight: 2,
                indicator: MyUnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 2.0, color: ColorsUtil.hexColor(0xDB3535)),
                    lineWidth: duSetWidth(120)),
                indicatorSize: TabBarIndicatorSize.label,
                // 指示器的大小计算方式，以文本方式
                isScrollable: true,
                //labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                labelStyle: TextStyle(fontSize: duSetFontSize(30)),
                tabs: tabs.map((tabName) {
                  return Tab(
                    text: tabName,
                  );
                }).toList()),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _buildCardItem(),
                _buildCardItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: duSetWidth(30)),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    "石家庄炼化",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "20万吨",
                      textAlign: TextAlign.center,
                    )),
                Expanded(flex: 1, child: Text("停车检修")),
              ],
            ),
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    "徐州海天",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "20万吨",
                      textAlign: TextAlign.center,
                    )),
                Expanded(flex: 1, child: Text("3月3日故障临时停车，预计检修10天左右")),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("数据分析"),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildTime(context),
              _buildProduct(),
              _buildTab(context),
              Expanded(
                flex: 1,
                child: _buildMap(),
              ),
              /* Stack(
                children: <Widget>[
                  Container(
                    width: duSetWidth(710),
                    height: duSetHeight(352),
                    child: Card(
                      child: Text("1234"),
                    ),
                  ),
                ],
              ),*/
            ],
          ),
          Positioned(
            bottom: 0,
            left: duSetWidth(20),
            child: Container(
              width: duSetWidth(710),
              height: duSetHeight(325),
              child: Card(
                margin: EdgeInsets.all(0),
                child: _buildCardTab(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0)),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: duSetHeight(500),
            left: duSetWidth(30),
            child: Text(
              "国内产能分布图",
              style: TextStyle(
                  color: ColorsUtil.hexColor(0x222222),
                  fontSize: duSetFontSize(28),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
