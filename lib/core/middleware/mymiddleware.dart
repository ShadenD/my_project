import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/routes.dart';
import 'package:my_project/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
