import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:juxitang/common/routers/application.dart';
import 'package:juxitang/common/utils/utils.dart';

class LoginWithMessage extends StatelessWidget {
  Widget _buildLogo() {
    return Hero(
      tag: "logo",
      child: Container(
        width: double.infinity,
        height: duSetHeight(140.0 + 144 + 150),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              duSetWidth(303), duSetWidth(150), duSetWidth(303), duSetWidth(140)),
          child: Container(
            width: duSetWidth(144),
            height: duSetHeight(144),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: duSetWidth(60)),
      child: Form(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: duSetHeight(25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone_android,
                        color: Colors.white,
                      ),
                      Text("+86",style: TextStyle(color: Colors.white,fontSize: duSetFontSize(30)),),
                    ],
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                  },
                  cursorColor: Colors.white,
                  // 改变光标颜色
                  cursorWidth: 1.0,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  maxLengthEnforced: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: duSetWidth(110.0), top: duSetHeight(0.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(255, 255, 255, 0.3)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(255, 255, 255, 0.3)),
                    ),
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(
                      color: ColorsUtil.hexColor(0x999999),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBtns(context) {
    return Container(
      margin: EdgeInsets.only(
          top: duSetHeight(30.0),
          left: duSetWidth(60.0),
          right: duSetWidth(60.0)),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: duSetHeight(88.0),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).primaryColor,
              colorBrightness: Brightness.dark,
              splashColor: Theme.of(context).primaryColor,
              child: Text(
                "获取短信验证码",
                style: TextStyle(fontSize: duSetFontSize(34.0)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Application.router.navigateTo(context, "/SMSVerificationCode",transition: TransitionType.cupertino);
              },
            ),
          ),
          SizedBox(
            height: duSetHeight(30.0),
          ),
          GestureDetector(
            child: Text(
              "使用账号密码登录",
              style: TextStyle(
                color: ColorsUtil.hexColor(0xcccccc),
              ),
            ),
            onTap: () => Application.router.navigateTo(context, "/login",clearStack: true,transition: TransitionType.cupertino),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherWayTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/line_left.png"),
        SizedBox(
          width: duSetWidth(30),
        ),
        Text(
          "其他快捷登录",
          style: TextStyle(
            color: ColorsUtil.hexColor(0xcccccc),
            fontSize: duSetFontSize(24),
          ),
        ),
        SizedBox(
          width: duSetWidth(30),
        ),
        Image.asset("assets/images/line_right.png"),
      ],
    );
  }

  Widget _buildOtherWayBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: duSetWidth(135)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset("assets/images/zhifubao.png"),
              SizedBox(
                height: duSetHeight(12),
              ),
              Text(
                "支付宝",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset("assets/images/weixin.png"),
              SizedBox(
                height: duSetHeight(12),
              ),
              Text(
                "微信",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset("assets/images/qq.png"),
              SizedBox(
                height: duSetHeight(12),
              ),
              Text(
                "qq",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildLoginForm(),
            _buildBtns(context),
            SizedBox(
              height: duSetHeight(266),
            ),
            _buildOtherWayTitle(),
            SizedBox(
              height: duSetHeight(50),
            ),
            _buildOtherWayBtn(),
          ],
        ),
      ),
    );
  }
}
