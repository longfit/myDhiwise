import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/guest_login_screen/guest_login_screen.dart';

class AppRoutes {
  static const String guestLoginScreen = '/guest_login_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        guestLoginScreen: GuestLoginScreen.builder,
        initialRoute: GuestLoginScreen.builder
      };
}
