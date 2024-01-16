import 'package:get_storage/get_storage.dart';

class StorageUtil {
  StorageUtil._();

  static Future initialize() async {
    await GetStorage.init();
  }

  static void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  static dynamic read(String key, {dynamic defaultValue}) {
    return GetStorage().read(key) ?? defaultValue;
  }

  static Future remove(String key) async {
    await GetStorage().remove(key);
  }

  static void erase() async {
    await GetStorage().erase();
  }
}
