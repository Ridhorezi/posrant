// ignore_for_file: unnecessary_import

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posrant/core.dart';
import 'package:posrant/service/auth_service/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  void _showSuccessMessage() {
    Fluttertoast.showToast(
      msg: 'Login Sucesssfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.lightBlue,
      textColor: Colors.white,
    );
  }

  void _showErrorMessage() {
    Fluttertoast.showToast(
      msg: 'Ups! something when wrong!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  String email = "19210471@bsi.ac.id";
  String password = "password";

  doLogin() async {
    showLoading();
    try {
      await AuthService().login(
        email: email,
        password: password,
      );
      Get.offAll(const MainNavigationView());
      hideLoading();
      _showSuccessMessage();
    } on Exception {
      hideLoading();
      _showErrorMessage();
    }
  }

  Future<void> loginWithGoogle() async {
    showLoading();
    try {
      await AuthService().loginWithGoogle();
      Get.offAll(const MainNavigationView());
      hideLoading();
      _showSuccessMessage();
    } catch (e) {
      hideLoading();
      _showErrorMessage();
    }
  }
}
