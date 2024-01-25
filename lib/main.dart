import 'package:bamboo_shoot/controllers/theme_controller.dart';
import 'package:bamboo_shoot/controllers/touch_controller.dart';
import 'package:bamboo_shoot/locales/locales.dart';
import 'package:bamboo_shoot/views/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ThemeController());
  Get.put(TouchController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Obx(
          () {
            return GetMaterialApp(
              defaultTransition: Transition.cupertino,
              theme: themeController.themes[themeController.currentTheme.value],
              debugShowCheckedModeBanner: true,
              initialRoute: Pages.homeScreen,
              getPages: Pages.pages,
              translations: AppTranslations(),
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('zh', 'CN'),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Get.locale,
              fallbackLocale: const Locale('en', 'US'),
              scrollBehavior: const ScrollBehavior().copyWith(
                overscroll: true,
                physics: const BouncingScrollPhysics(),
              ),
            );
          },
        );
      },
    );
  }
}
