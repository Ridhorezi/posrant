import 'package:flutter/material.dart';
import 'package:posrant/core.dart';
// ignore: unnecessary_import
import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  const ProductFormView({Key? key}) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      QImagePicker(
                        label: "Photo",
                        hint: "Your photo",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {},
                      ),
                      QTextField(
                        label: "Product name",
                        validator: Validator.required,
                        onChanged: (value) {},
                      ),
                      QNumberField(
                        label: "Price",
                        validator: Validator.required,
                        onChanged: (value) {},
                      ),
                      QDropdownField(
                        label: "Category",
                        items: const [
                          {
                            "label": "Drink",
                            "value": "Drink",
                          },
                          {
                            "label": "Main Course",
                            "value": "Main Course",
                          },
                          {
                            "label": "Salad",
                            "value": "Salad",
                          },
                          {
                            "label": "Snack",
                            "value": "Snack",
                          },
                        ],
                        onChanged: (value, label) {},
                      ),
                      QMemoField(
                        label: "Description",
                        validator: Validator.required,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: () {},
          child: const Text("Checkout"),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
