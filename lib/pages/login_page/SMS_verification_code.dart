import 'package:flutter/material.dart';
import 'package:juxitang/common/utils/utils.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'dart:async';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();
  var _isStartCountdownTime = false; // 是否开始验证码计时
  Timer _timer;
  int _countdownTime = 5; // 验证码时间
  var _isReGetCode = false; //是否重新获取验证码

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  void startCountdownTimer() {
    setState(() {
      _isReGetCode = false;
    });
    const oneSec = const Duration(seconds: 1);
    var callback = (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
          _timer = null;
          _isStartCountdownTime = false;
          _isReGetCode = true;
          _countdownTime = 5;
        } else {
          _countdownTime = _countdownTime - 1;
          _isStartCountdownTime = true;
          _isReGetCode = false;
        }
      });
    };

    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isStartCountdownTime = true;
    startCountdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("输入短信验证码"),
        ),
        body: Container(
          padding: EdgeInsets.only(
              top: duSetHeight(80),
              left: duSetWidth(60),
              right: duSetWidth(60)),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "已向您的手机发送验证码",
                  style: TextStyle(
                    color: ColorsUtil.hexColor(0x787878),
                    fontSize: duSetFontSize(28),
                  ),
                ),
              ),
              SizedBox(
                height: duSetHeight(50),
              ),
              PinInputTextField(
                onChanged: (value) {
                  if (value.length == 4 && !_isStartCountdownTime) {}
                },
                decoration: UnderlineDecoration(
                  gapSpace: duSetWidth(50),
                  lineHeight: 1,
                  color: ColorsUtil.hexColor(0xcccccc),
                  textStyle: TextStyle(
                    color: ColorsUtil.hexColor(0x222222),
                    fontSize: duSetFontSize(54),
                  ),
                ),
                autoFocus: false,
                pinLength: 4,
                controller: _pinEditingController,
              ),
              SizedBox(
                height: duSetHeight(42),
              ),
              Visibility(
                visible: _isReGetCode,
                child: GestureDetector(
                  child: Text(
                    "重新获取验证码",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      color: Theme.of(context).primaryColor,
                      fontSize: duSetFontSize(28),
                    ),
                  ),
                  onTap: () => startCountdownTimer(),
                ),
              ),
              Visibility(
                visible: !_isReGetCode,
                child: Text(
                  "$_countdownTime秒后重新获取验证码",
                  style: TextStyle(
                      color: ColorsUtil.hexColor(0x999999),
                      fontSize: duSetFontSize(28)),
                ),
              ),
            ],
          ),
        ));
  }
}
