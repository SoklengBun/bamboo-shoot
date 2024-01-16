import 'package:bamboo_shoot/views/pages/home/home.dart';
import 'package:get/get.dart';

class Pages {
  Pages._();

  static const homeScreen = '/homeScreen';

  static final List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => HomePage(),
    ),
  ];
}
