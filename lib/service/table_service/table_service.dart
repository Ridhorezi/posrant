import 'package:cloud_firestore/cloud_firestore.dart';

class TableService {
  create({
    required String tableNumber,
    required int orderIndex,
    String? orderId,
    String? status = "Available",
  }) async {
    await FirebaseFirestore.instance.collection("tables").add({
      "table_number": tableNumber,
      "order_id": orderId,
      "status": status,
      "order_index": orderIndex,
    });
  }

  deleteAll() async {
    var snapShot = await FirebaseFirestore.instance.collection("tables").get();
    for (var i = 0; i < snapShot.docs.length; i++) {
      await FirebaseFirestore.instance
          .collection("tables")
          .doc(snapShot.docs[i].id)
          .delete();
    }
  }
}
