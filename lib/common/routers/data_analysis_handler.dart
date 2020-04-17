part of 'router_handler.dart';

/// 数据分析
Handler dataAnalysisHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return DataAnalysis();
    });


/// 价格模块
Handler pricePageHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PricePage();
    });
