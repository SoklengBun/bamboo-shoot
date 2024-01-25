// import 'package:bamboo_shoot/views/themes/theme.dart';
import 'package:bamboo_shoot/controllers/theme_controller.dart';
import 'package:bamboo_shoot/controllers/touch_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ThemeController theme = Get.find();
  final TouchController touch = Get.find();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        touch.showAnimation.value = false;
        touch.top.value = details.localPosition.dy;
        touch.left.value = details.localPosition.dx;
        touch.showAnimation.value = true;
      },
      onPointerMove: (details) {
        touch.top.value = details.localPosition.dy;
        touch.left.value = details.localPosition.dx;
      },
      onPointerUp: (details) async {
        touch.isAnimationEnd.value = true;
        await Future.delayed(const Duration(milliseconds: 1000), () {
          touch.showAnimation.value = false;
          touch.isAnimationEnd.value = false;
        });
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                'HomePage'.tr,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            body: Center(
              child: TextButton(
                onPressed: () => theme.changeTheme(),
                child: Text(
                  'change theme ${touch.top.value}',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
          ),
          Obx(() {
            return Visibility(
              visible: touch.showAnimation.value,
              child: Positioned(
                top: touch.top.value,
                left: touch.left.value,
                child: Image.asset(
                  touch.isAnimationEnd.value
                      ? 'assets/image/kokkoro_dance.gif'
                      : 'assets/image/kokkoro.gif',
                  height: 20.w,
                  width: 20.w,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
