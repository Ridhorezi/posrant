import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posrant/core.dart';
// ignore: unnecessary_import
import '../controller/pos_table_controller.dart';

class PosTableView extends StatefulWidget {
  const PosTableView({Key? key}) : super(key: key);

  Widget build(context, PosTableController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pos Table"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("tables")
                    .orderBy("order_index")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No data!");
                  }

                  final data = snapshot.data!;

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8,
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: data.docs.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item =
                          data.docs[index].data() as Map<String, dynamic>;

                      var used = item["status"] == "Used";

                      var color = primaryColor;

                      if (used) {
                        color = usedColor;
                      }

                      return InkWell(
                        onTap: () {
                          if (used) {
                            showInfoDialog("Not available");
                            return;
                          }
                          Get.offAll(PosOrderView(
                            tableNumber: item["table_number"],
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item["table_number"],
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: primaryTextColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<PosTableView> createState() => PosTableController();
}
