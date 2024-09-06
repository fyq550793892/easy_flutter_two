import 'package:easy_flutter/local_language_module/local_message.dart';
import 'package:easy_flutter/main_page_modules/main_second/main_second_view.dart';
import 'package:easy_flutter/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 500),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: RouteConfig.appHomePage,
          getPages: RouteConfig.getPages,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          translations: LocalMessage(),
          locale: Locale('zh', 'CN'),
          fallbackLocale: Locale('en', 'US'),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
            GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
            GlobalWidgetsLocalizations.delegate
          ],
          // onGenerateRoute: (setting) {
          //   return MaterialPageRoute(builder: (context) {
          //     // 这里可以统一处理登录页面
          //     // switch (settings.name) {
          //     //   case '/':
          //     //     return MaterialPageRoute(
          //     //       builder: (context) => HomeScreen(),
          //     //     );
          //     //   case '/settings':
          //     //     return MaterialPageRoute(
          //     //       builder: (context) => SettingsScreen(),
          //     //     );
          //     //   default:
          //     //   // 当没有匹配的路由时，返回一个默认的路由
          //     //     return MaterialPageRoute(
          //     //       builder: (context) => NotFoundScreen(),
          //     //     );
          //     // }
          //     return MainSecondPage();
          //   });
          // },
          supportedLocales: [
            const Locale('en', 'US'), // 美国英语
            const Locale('zh', 'CN'), // 中文简体
            //其他Locales
          ],
          builder: EasyLoading.init(),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
