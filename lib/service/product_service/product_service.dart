// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final _firestore = FirebaseFirestore.instance;
  Future<bool> create({
    required String photo,
    required String productName,
    required double price,
    required String category,
    required String description,
  }) async {
    try {
      await _firestore.collection("products").add({
        "photo": photo,
        "product_name": productName,
        "price": price,
        "category": category,
        "description": description,
      });
      return true; // Berhasil disimpan
    } catch (e) {
      print(e);
      return false; // Gagal disimpan
    }
  }
}
