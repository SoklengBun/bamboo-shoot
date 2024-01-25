import 'package:get/get.dart';

class TouchController extends GetxController {
  RxDouble top = 0.0.obs;
  RxDouble left = 0.0.obs;
  RxBool showAnimation = false.obs;
  RxBool isAnimationEnd = false.obs;
}
