import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posrant/service/auth_service/auth_service.dart';
import 'package:posrant/shared/util/dialog/show_info_dialog.dart';
import 'package:posrant/shared/util/show_loading/show_loading.dart';
import 'package:posrant/state_util.dart';
import '../view/forgot_view.dart';

class ForgotController extends State<ForgotView> implements MvcController {
  static late ForgotController instance;
  late ForgotView view;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      msg: 'Link resset password has been succesfully send to your email.',
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

  doForgotPassword() async {
    showLoading();
    try {
      await AuthService().forgotPassword(
        email: email,
      );
      hideLoading();
      Get.back();
      _showSuccessMessage();
    } on Exception {
      hideLoading();
      _showErrorMessage();
      showInfoDialog("Ups! something when wrong !");
    }
  }
}
