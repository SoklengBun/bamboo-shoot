// import 'package:bamboo_shoot/views/themes/theme.dart';
import 'package:bamboo_shoot/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ThemeController theme = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'.tr),
      ),
      body: TextButton(
        onPressed: () => theme.changeTheme(),
        child: Text('change theme'),
      ),
    );
  }
}
