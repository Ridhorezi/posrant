import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  Future<bool> create({
    required String tableNumber,
    required List items,
    required double total,
    required String paymentMethod,
    required String status,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("orders").add({
        "created_at": Timestamp.now(),
        "table_number": tableNumber,
        "items": items,
        "total": total,
        "status": status,
      });

      var snapshot = await FirebaseFirestore.instance
          .collection("tables")
          .where("table_number", isEqualTo: tableNumber)
          .get();

      var tableDocId = snapshot.docs.first.id;

      await FirebaseFirestore.instance
          .collection("tables")
          .doc(tableDocId)
          .update(
        {
          "status": "Used",
        },
      );

      return true; // Operasi berhasil
    } catch (error) {
      // ignore: avoid_print
      print(error);
      return false; // Terjadi kesalahan atau gagal
    }
  }
}