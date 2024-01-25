import 'package:bamboo_shoot/views/themes/theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxInt currentTheme = 0.obs;

  var themes = [
    CustomTheme.lightTheme,
    CustomTheme.darkTheme,
    CustomTheme.pinkTheme,
  ];

  void toggleTheme() {
    if (themes.length - 1 == currentTheme.value) {
      currentTheme.value = 0;
      return;
    }
    currentTheme.value += 1;
  }

  void changeTheme() {
    toggleTheme();
  }
}
