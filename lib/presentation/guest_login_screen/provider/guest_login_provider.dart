import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/guest_login_model.dart';

/// A provider class for the GuestLoginScreen.
///
/// This provider manages the state of the GuestLoginScreen, including the
/// current guestLoginModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GuestLoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GuestLoginModel guestLoginModelObj = GuestLoginModel();

  bool isShowPassword = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
