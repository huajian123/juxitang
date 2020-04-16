import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:juxitang/pages/home/home_page.dart';
import 'package:juxitang/pages/pages.dart';
part 'data_analysis_handler.dart';
part 'home_handler.dart';
/*-------登录------*/
Handler loginHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container();
});

/// 用短信登录
Handler loginWithMessageHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container();
});

/// 获取短信验证码
Handler SMSVerificationCodeHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container();
});

/// 注册
Handler registerHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container();
});

/// 账号密码登录
Handler loginPageHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Text("主页");
});
