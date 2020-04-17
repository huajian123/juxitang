import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:juxitang/common/routers/application.dart';
import 'package:juxitang/common/utils/toast.dart';
import 'package:juxitang/common/utils/utils.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userControl = new TextEditingController();
  final TextEditingController _pwdControl = new TextEditingController();
  var _showCleanBtn = false;
  var _showPasswordFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("注册"),
        ),
        body: Container(
          padding: EdgeInsets.only(
              top: duSetHeight(80.0),
              left: duSetWidth(60),
              right: duSetWidth(60)),
          child: Form(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      top: duSetHeight(25.0),
                      child: Icon(Icons.phone_android,
                          color: ColorsUtil.hexColor(0x999999)),
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: _userControl,
                      onChanged: (value) {
                        print(_showCleanBtn);
                        setState(() {
                          value == ""
                              ? _showCleanBtn = false
                              : _showCleanBtn = true;
                        });
                      },
                      cursorColor: ColorsUtil.hexColor(0x999999),
                      // 改变光标颜色
                      cursorWidth: 1.0,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: _showCleanBtn
                            ? EdgeInsets.only(
                                left: duSetWidth(60.0), top: duSetHeight(0.0))
                            : EdgeInsets.only(left: duSetWidth(60.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1)),
                        ),
                        hintText: "请输入手机号",
                        hintStyle: TextStyle(
                          color: ColorsUtil.hexColor(0x999999),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showCleanBtn,
                      child: Positioned(
                        right: 0,
                        top: duSetHeight(0.0),
                        child: IconButton(
                          icon: Icon(Icons.clear,
                              color: ColorsUtil.hexColor(0x999999)),
                          onPressed: () {
                            setState(() {
                              _userControl.clear();
                              _showCleanBtn = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      top: duSetHeight(22.0),
                      child: Icon(
                        Icons.lock_outline,
                        color: ColorsUtil.hexColor(0x999999),
                      ),
                    ),
                    TextFormField(
                      autofocus: false,
                      cursorColor: ColorsUtil.hexColor(0x999999),
                      // 改变光标颜色
                      cursorWidth: 1.0,
                      controller: _pwdControl,
                      style: TextStyle(color: Colors.black),
                      obscureText: !_showPasswordFlag,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: duSetWidth(60.0), top: duSetHeight(0.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1)),
                        ),
                        hintText: "请输入密码",
                        hintStyle: TextStyle(
                          color: ColorsUtil.hexColor(0x999999),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: duSetHeight(0.0),
                      child: _showPasswordFlag
                          ? IconButton(
                              icon: Icon(
                                Iconfont.openeyes,
                                color: ColorsUtil.hexColor(0x999999),
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPasswordFlag = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Iconfont.eyeOff,
                                color: ColorsUtil.hexColor(0x999999),
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPasswordFlag = true;
                                });
                              },
                            ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      top: duSetHeight(22.0),
                      child: Icon(
                        Icons.beenhere,
                        color: ColorsUtil.hexColor(0x999999),
                      ),
                    ),
                    TextFormField(
                      autofocus: false,
                      cursorColor: ColorsUtil.hexColor(0x999999),
                      // 改变光标颜色
                      cursorWidth: 1.0,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: duSetWidth(60.0), top: duSetHeight(0.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1)),
                        ),
                        hintText: "请输入验证码",
                        hintStyle: TextStyle(
                          color: ColorsUtil.hexColor(0x999999),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: duSetHeight(30.0),
                        child: GestureDetector(
                          onTap: () {
                            Application.router.navigateTo(
                                context, "/SMSVerificationCode",
                                transition: TransitionType.cupertino);
                          },
                          child: Text(
                            "获取验证码",
                            style: TextStyle(
                              color: ColorsUtil.hexColor(0xDB3535),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: duSetHeight(60),),
                Stack(
                  children: <Widget>[  Container(
                    width: double.infinity,
                    height: duSetHeight(88.0),
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      highlightColor: Theme.of(context).primaryColor,
                      colorBrightness: Brightness.dark,
                      splashColor: Theme.of(context).primaryColor,
                      child: Text(
                        "立即注册",
                        style: TextStyle(fontSize: duSetFontSize(34.0)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        if (_pwdControl.value.text == "" ||
                            _userControl.value.text == "") {
                          toastInfo(
                              msg: '请输入用户名或密码',
                              postion: ToastGravity.CENTER,
                              fontSize: duSetFontSize(24));
                          return;
                        }
                      },
                    ),
                  ),],
                ),
              ],
            ),
          ),
        ));
  }
}
