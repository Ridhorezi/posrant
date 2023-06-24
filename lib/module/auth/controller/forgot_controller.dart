import 'package:flutter/material.dart';
import 'package:posrant/state_util.dart';
import '../view/forgot_view.dart';

class ForgotController extends State<ForgotView> implements MvcController {
  static late ForgotController instance;
  late ForgotView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
