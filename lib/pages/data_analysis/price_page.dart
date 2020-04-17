import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:juxitang/common/utils/date.dart';
import 'package:juxitang/common/utils/utils.dart';
import 'package:juxitang/common/widgets/my_tab_indicator.dart';

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}


// 混入的AutomaticKeepAliveClientMixin用来保持状态
class _PricePageState extends State<PricePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  TabController _tabController;
  List<Map<String, dynamic>> _chipList = [
    {"label": "汇率", "isChecked": false},
    {"label": "原油", "isChecked": false},
    {"label": "石脑油", "isChecked": false},
    {"label": "煤", "isChecked": false},
    {"label": "PP粒", "isChecked": false},
    {"label": "丙烷", "isChecked": false},
  ];
  String _dropdownValue = "价格";
  List<String> _dropdownValueList = ["种类", "价格", "名称"];

  /*时间*/
  DateTime firstDate = DateTime.now();

  DateTime secondDate = DateTime.now();

  /*时间*/

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("价格模块"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: duSetHeight(96),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: ColorsUtil.hexColor(0xE6E6E6),
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: ColorsUtil.hexColor(0xDB3535),
              indicatorColor: ColorsUtil.hexColor(0xDB3535),
              unselectedLabelColor: ColorsUtil.hexColor(0x222222),
              indicatorWeight: 2,
              indicator: MyUnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: ColorsUtil.hexColor(0xDB3535),
                ),
                lineWidth: duSetWidth(50),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              // 指示器的大小计算方式，以文本方式
              isScrollable: false,
              //labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              labelStyle: TextStyle(fontSize: duSetFontSize(30)),
              tabs: <Widget>[
                Tab(text: '价格数据'),
                Tab(text: '期货数据'),
                Tab(text: '价差指标'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _buildPriceData(context),
                Text("期货数据"),
                Text("价差指标"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipItem(int index) {
    return Container(
      margin: EdgeInsets.only(
        right: duSetWidth(20),
      ),
      child: ActionChip(
        labelStyle: TextStyle(
          color: _chipList[index]["isChecked"]
              ? ColorsUtil.hexColor(0xDB3535)
              : ColorsUtil.hexColor(0x222222),
        ),
        backgroundColor: _chipList[index]["isChecked"]
            ? ColorsUtil.hexColor(0xFFE4E4)
            : ColorsUtil.hexColor(0xF7F7F7),
        onPressed: () {
          setState(() {
            if (_chipList[index]["isChecked"] == true) {
              _chipList[index]["isChecked"] = false;
              return;
            }
            for (var i = 0; i < _chipList.length; i++) {
              _chipList[i]["isChecked"] = false;
            }
            _chipList[index]["isChecked"] = true;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        label: Text(_chipList[index]["label"]),
      ),
    );
  }

  Widget _buildPriceData(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: duSetHeight(100),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: duSetWidth(50)),
              scrollDirection: Axis.horizontal,
              itemCount: _chipList.length,
              itemBuilder: (context, index) {
                return _buildChipItem(index);
              },
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: duSetWidth(30),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsUtil.hexColor(0xcccccc),
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _dropdownValue,
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          _dropdownValue = newValue;
                        });
                      },
                      items: _dropdownValueList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2080, 6, 7),
                          onChanged: (date) {}, onConfirm: (date) {
                        setState(() {
                          firstDate = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.zh);
                    },
                    child: Text(
                      formateDate(firstDate),
                      style: TextStyle(
                        color: ColorsUtil.hexColor(0x222222),
                      ),
                    ),
                  ),
                  Text("至"),
                  FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2080, 6, 7),
                          onChanged: (date) {}, onConfirm: (date) {
                        setState(() {
                          secondDate = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.zh);
                    },
                    child: Text(
                      formateDate(secondDate),
                      style: TextStyle(
                        color: ColorsUtil.hexColor(0x222222),
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              )),
          SizedBox(
            height: duSetHeight(20),
          ),
          Container(
            child:Text("图标"),
            width: double.infinity,
            height: duSetHeight(390),
          ),
        ],
      ),
    );
  }
}
