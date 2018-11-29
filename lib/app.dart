import 'package:camposter/home_bar.dart';
import 'package:camposter/mypage_setting/setting.dart';
import 'package:camposter/mypage_setting/setting_center.dart';
import 'package:camposter/mypage_setting/setting_notice.dart';
import 'package:camposter/mypage_setting/setting_person.dart';
import 'package:camposter/mypage_setting/setting_push.dart';
import 'package:camposter/mypage_setting/setting_service.dart';
import 'package:camposter/mypage_setting/setting_version.dart';
import 'package:flutter/material.dart';
import 'package:camposter/css/colors.dart';

class CamPosterApp extends StatelessWidget {

  final primarySwatchColor = const Color(0xFFB52F28);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAMPOSTER',
      theme: _buildCamPosterTheme(),
      home: HomeBarPage(),
//      initialRoute: '/login',
    onGenerateRoute: _getRoute,
      routes: {
        '/setting': (context) => SettingPage(),
        '/center': (context) => SettingCenterPage(),
        '/notice': (context) => SettingNoticePage(),
        '/person': (context) => SettingPersonPage(),
        '/push': (context) => SettingPushPage(),
        '/service': (context) => SettingServicePage(),
        '/version': (context) => SettingVersionPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings setting) {
    if (setting.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void> (
      settings: setting,
      builder: (BuildContext context) => SettingPage(),
      fullscreenDialog: true,
    );
  }
}

ThemeData _buildCamPosterTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: CamPosterRed,
    primaryColor: CamPosterRed,
    scaffoldBackgroundColor: CamPosterBackgroundWhite,
  );
}