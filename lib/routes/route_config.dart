import 'package:easy_flutter/auto_scroll_pages/auto_scroll_pages.dart';
import 'package:easy_flutter/custom_view_modules/custom_view_page.dart';
import 'package:easy_flutter/custom_widget_modules/custom_widget_page.dart';
import 'package:easy_flutter/get_use/middle_use/login_middle.dart';
import 'package:easy_flutter/global/state_bar/state_bar_use_widget.dart';
import 'package:easy_flutter/home_page/main_home_page.dart';
import 'package:easy_flutter/location_modules/location_page.dart';
import 'package:easy_flutter/login_pages/login_page.dart';
import 'package:easy_flutter/login_pages/num_code_page.dart';
import 'package:easy_flutter/main_page_modules/main/main_view.dart';
import 'package:easy_flutter/main_page_modules/main_second/main_second_view.dart';
import 'package:easy_flutter/permission_modules/permission_page.dart';
import 'package:easy_flutter/system_info_modules/system_info_page.dart';
import 'package:easy_flutter/ui_widgets/dialog_widget.dart';
import 'package:easy_flutter/widget_study_modules/long_pic_save/long_pic_save_view.dart';
import 'package:easy_flutter/widget_study_modules/widget_study_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

/**
 * @Author: fanyuqing
 * @Description: 路由名
 * @date: 2022/4/12
 */
class RouteConfig {
  static const String appHomePage = "/"; //
  // static const String jverifyPage = "/jverifyPage";
  // static const String tabViewPage = "/tabViewPage"; // 主页
  static const String loginPage = "/loginPage"; // 登录
  static const String mainPage = "/mainPage";
  static const String mainSecondPage = "/mainSecondPage";
  static const String inputCodePage = "/inputCodePage"; // 输入验证码
  static const String permissionPage = "/permissionPage"; // 权限页
  static const String locationPage = "/locationPage"; // 定位页
  static const String customViewPage = "/customViewPage"; // 自定义绘制页
  static const String customWidgetPage = "/customWidgetPage"; // 自定义绘制页
  static const String pageViewPage = "/pageViewPage"; // pageView练习页
  static const String globalBarPage = "/globalBarPage"; // 状态栏页面

  // static const String studyFlagPage = "/studyFlagPage"; // 兴趣爱好
  // static const String serviceAgreementPage = "/serviceAgreementPage";
  // static const String privacyAgreementPage = "/privacyAgreementPage";
  // static const String editDataPage = "/editDataPage"; // 修改个人信息
  // static const String aboutUsPage = "/aboutUsPage"; // 关于我们
  // static const String accountSafeMainPage = "/accountSafeMainPage"; // 注销账号
  // static const String accountSafeDetailPage = "/accountSafeDetailPage"; // 注销账号
  // static const String bindPhonePage = "/bindPhonePage"; // 绑定手机号
  // static const String otherInputCodePage = "/otherInputCodePage"; // 绑定手机号输入验证码
  // static const String myPayPage = "/myPayPage"; // 我的订单
  // static const String myPayDetailPage = "/myPayDetailPage"; // 我的订单
  // static const String feedBackPage = "/feedBackPage"; // 意见反馈
  // static const String consultingServicePage = "/consultingServicePage"; // 咨询页
  // static const String deBugPage = "/deBugPage"; //调试页
  static const String infoPage = "/infoPage"; // infoPage
  static const String dialogShowPage = "/dialogShowPage"; // dialogShowPage
  static const String autoScrollPage = "/autoScrollPage"; // 自动滚动页面
  static const String longPicSavePage = "/longPicSavePage"; // 长图保存页

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(
      name: appHomePage,
      page: () => MyHomePage(
        title: '首页',
      ),
    ),
    GetPage(
      name: mainPage,
      page: () => MainPage(),
    ),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: inputCodePage, page: () => NumCodePage()),
    GetPage(
        name: mainSecondPage,
        page: () => MainSecondPage(),
        middlewares: [LoginMiddle()]),
    GetPage(name: permissionPage, page: () => PermissionPage()),
    GetPage(name: locationPage, page: () => LocationPage()),
    GetPage(name: customViewPage, page: () => CustomViewPage()),
    GetPage(name: customWidgetPage, page: () => CustomWidgetPage()),
    GetPage(name: pageViewPage, page: () => WidgetStudyPage()),
    GetPage(name: globalBarPage, page: () => StateBarUserWidget()),

    // GetPage(name: studyFlagPage, page: () => StudyFlagPage()),
    // GetPage(name: serviceAgreementPage, page: () => ServiceAgreementPage()),
    // GetPage(name: privacyAgreementPage, page: () => PrivacyAgreementPage()),
    // GetPage(name: editDataPage, page: () => EditDataPage()),
    // GetPage(name: aboutUsPage, page: () => AboutUsPage()),
    // GetPage(name: accountSafeMainPage, page: () => AccountSafeMainPage()),
    // GetPage(name: accountSafeDetailPage, page: () => AccountSafeDetailPage()),
    // GetPage(name: bindPhonePage, page: () => BindPhonePage()),
    // GetPage(name: otherInputCodePage, page: () => OtherBindPhoneNum()),
    // GetPage(name: myPayPage, page: () => MyPayPage()),
    // GetPage(name: myPayDetailPage, page: () => MyPayDetailPage()),
    // GetPage(name: feedBackPage, page: () => FeedBackPage()),
    // GetPage(name: consultingServicePage, page: () => ConsultingServicePage()),
    // GetPage(name: deBugPage, page: () => DeBugPage()),
    GetPage(name: infoPage, page: () => SystemInfoPage()),
    GetPage(name: dialogShowPage, page: () => DialogWidget()),
    GetPage(
      name: autoScrollPage,
      page: () => AutoScrollPages(
        key: PageStorageKey("autoScrollPages"),
      ),
    ),
    GetPage(name: longPicSavePage, page: () => LongPicSavePage()),
  ];
}
