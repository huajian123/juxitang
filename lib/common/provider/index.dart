import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, Consumer, MultiProvider, Provider, Selector;
import 'package:provider/single_child_widget.dart';
import 'current_page_index.dart';
import 'provider.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CurrentPageIndexProvider>(
    create: (_) => CurrentPageIndexProvider(),
  ),
  ChangeNotifierProvider<LeftNavIndexProvider>(
    create: (_) => LeftNavIndexProvider(),
  )
];

class Store {
  static BuildContext context;
  static BuildContext widgetCtx;

  static  init({context, child}) {
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }

  //  Store.value<T>(context)获取状态数据
  static T value<T>(context) {
    return Provider.of<T>(context, listen: true);
  }

  // Consumer<Model>(builder:(context,t child){return})  t为传进来的实体
  static Consumer connect<T>({builder, t, child}) {
    return Consumer<T>(builder: builder, child: child);
  }

  // A想要获取的实体，S想要从该实体中获取到的哪个值，提取A实体中的S变量，来进行对比
/*  Selector<ThemeModel,ThemeType>(
      builder:(context,type,child){
        String result="切换成";
        if(type==ThemeType.dart){
          result+="白天"
         }else{
           result+="黑夜"
         }
        return Text(result)
       },
        selector:(context,thememodel){
          return themeModel.current.type
        },
        shouldRebuild:(pre,next){
        return pre!=next;
          }
      )*/
  static Selector sel<A, S>({builder, selector}) {
    return Selector<A, S>(
      builder: builder,
      selector: selector,
      shouldRebuild: (pre, next) => pre != next,
    );
  }
}
