import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:pretty_notch/src/notch_type.dart';

class NotchUtil {
  NotchUtil._();

  static Future<IosNotchType> get notchType async {
    if (!Platform.isIOS) return IosNotchType.noting;

    final machine = (await DeviceInfoPlugin().iosInfo).utsname.machine;

    return switch (machine) {
      'iPhone16,2' => IosNotchType.dynamicIsland,
      'iPhone16,1' => IosNotchType.dynamicIsland,
      'iPhone15,5' => IosNotchType.dynamicIsland,
      'iPhone15,4' => IosNotchType.dynamicIsland,
      'iPhone15,3' => IosNotchType.dynamicIsland,
      'iPhone15,2' => IosNotchType.dynamicIsland,
      'iPhone14,8' => IosNotchType.shortNotch,
      'iPhone14,7' => IosNotchType.shortNotch,
      'iPhone14,5' => IosNotchType.shortNotch,
      'iPhone14,4' => IosNotchType.shortNotch,
      'iPhone14,3' => IosNotchType.shortNotch,
      'iPhone14,2' => IosNotchType.shortNotch,
      'iPhone13,4' => IosNotchType.longNotch,
      'iPhone13,3' => IosNotchType.longNotch,
      'iPhone13,2' => IosNotchType.longNotch,
      'iPhone13,1' => IosNotchType.longNotch,
      'iPhone12,5' => IosNotchType.longNotch,
      'iPhone12,3' => IosNotchType.longNotch,
      'iPhone12,1' => IosNotchType.longNotch,
      'iPhone11,8' => IosNotchType.longNotch,
      'iPhone11,6' => IosNotchType.longNotch,
      'iPhone11,4' => IosNotchType.longNotch,
      'iPhone11,2' => IosNotchType.longNotch,
      'iPhone10,6' => IosNotchType.longNotch,
      'iPhone10,3' => IosNotchType.longNotch,
      _ => IosNotchType.noting,
    };
  }
}
