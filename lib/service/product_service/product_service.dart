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

  Future<bool> update({
    required String id,
    required String photo,
    required String productName,
    required double price,
    required String category,
    required String description,
  }) async {
    try {
      await _firestore.collection("products").doc(id).update({
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

  Future<bool> delete(String id) async {
    try {
      await _firestore.collection("products").doc(id).delete();
      return true; // Berhasil dihapus
    } catch (e) {
      print(e);
      return false; // Gagal dihapus
    }
  }
}
