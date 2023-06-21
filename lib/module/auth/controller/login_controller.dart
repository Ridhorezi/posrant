// ignore_for_file: unnecessary_import

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posrant/core.dart';
import 'package:posrant/service/auth_service/auth_service.dart';
import 'package:posrant/state_util.dart';
import '../../../shared/util/show_loading/show_loading.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "admin@demo.com";
  String password = "12345678";

  doLogin() async {
    showLoading();
    try {
      await AuthService().login(
        email: email,
        password: password,
      );
      hideLoading();
      Get.offAll(const MainNavigationView());
    } on Exception {
      hideLoading();
      showInfoDialog("Ups! something when wrong !");
    }
  }
}
