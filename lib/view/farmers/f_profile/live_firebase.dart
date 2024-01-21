import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/view_model/controller/firebase/firebase_controller.dart';

class LiveFirebaseData extends StatefulWidget {
  const LiveFirebaseData({Key? key}) : super(key: key);

  @override
  State<LiveFirebaseData> createState() => _LiveFirebaseDataState();
}

class _LiveFirebaseDataState extends State<LiveFirebaseData> {
  final FirebaseLiveDataController controller =
      Get.put(FirebaseLiveDataController());

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => controller.refreshApi());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.liveData.value != null) {
        return Column(children: <Widget>[
          Column(
            children: <Widget>[
              _buildDetailItem('humidity'.tr,
                  controller.liveData.value!.humidity.toString()),
              _buildDetailItem('soil_temperature'.tr,
                  controller.liveData.value!.soilMoisture.toString()),
              _buildDetailItem(
                  'temperature'.tr, controller.liveData.value!.temp.toString()),
            ],
          )
        ]);
      } else if (controller.error.value.isNotEmpty) {
        return Text('Error: ${controller.error.value}');
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}

Widget _buildDetailItem(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}
