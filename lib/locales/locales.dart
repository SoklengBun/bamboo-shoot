import 'package:bamboo_shoot/locales/en_us.dart';
import 'package:bamboo_shoot/locales/zh_cn.dart';
import 'package:bamboo_shoot/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_CN': zhCN,
      };
}

class AppLocale {
  AppLocale._();

  static Future initialize() async {
    var langCode = getLocale();
    setLocale(langCode ?? 'zh');
  }

  static const languageCode = 'languageCode';

  static void storeLocale(String value) {
    StorageUtil.write(languageCode, value);
  }

  static String? getLocale() {
    return StorageUtil.read(languageCode);
  }

  static void setLocale(String languageCode) {
    Locale locale;
    switch (languageCode) {
      case 'en':
        locale = const Locale('en', 'US');
        break;
      case 'zh':
        locale = const Locale('zh', 'CN');
        break;
      default:
        locale = const Locale('en', 'US');
        break;
    }

    Get.updateLocale(locale);
    storeLocale(locale.languageCode);
  }
}
