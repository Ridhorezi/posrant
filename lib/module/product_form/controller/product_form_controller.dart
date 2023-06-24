// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:posrant/core.dart';
import 'package:posrant/service/product_service/product_service.dart';
import 'package:posrant/shared/util/validator/validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductFormController extends State<ProductFormView>
    implements MvcController {
  static late ProductFormController instance;
  late ProductFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? id;
  String? photo;
  String? productName;
  double? price;
  String? category;
  String? description;

  String? productNameError;
  String? photoError;
  String? priceError;
  String? categoryError;
  String? descriptionError;

  void _validateForm() {
    photoError = Validator.required(photo);
    productNameError = Validator.required(productName);
    priceError = Validator.required(price?.toString());
    categoryError = Validator.required(category);
    descriptionError = Validator.required(description);
  }

  void _clearErrors() {
    productNameError = null;
    priceError = null;
    categoryError = null;
    descriptionError = null;
  }

  void _showSuccessMessage() {
    Fluttertoast.showToast(
      msg: 'Product saved successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: Colors.lightBlue,
      textColor: Colors.white,
    );
  }

  void _showErrorMessage() {
    Fluttertoast.showToast(
      msg: 'Failed to save product',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  bool _isValid() {
    return productNameError == null &&
        priceError == null &&
        categoryError == null &&
        descriptionError == null;
  }

  doSave() async {
    _clearErrors();
    _validateForm();
    if (_isValid()) {
      showLoading();
      bool success = await ProductService().create(
        photo: photo!,
        productName: productName!,
        price: price!,
        category: category!,
        description: description!,
      );
      hideLoading();
      if (success) {
        _showSuccessMessage();
        Get.to(const ProductListView());
      } else {
        _showErrorMessage();
        Get.back();
      }
    } else {
      setState(() {});
    }
  }
}
