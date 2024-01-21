import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/repository/farmer_repository/farmer_repository.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/farmer/available_donation_vm.dart';

class FarmerSubmitStatusController extends GetxController {
  AllAvailableDonationController controller =
      Get.put(AllAvailableDonationController());

  final _api = FarmerRepository();
  final loading = false.obs;

  void submitStatusApi(int id, String status, String comment, File image) {
    loading.value = true;

    var data = {
      "status": status,
      "comments": comment,
      "image_path": image,
    };

    _api.updateStatusApi(data, id).then((value) async {
      loading.value = false;

      if (value.data != null) {
        await controller.availableDonationListApi();
        Utils.snackBar("Success", "Status Submitted");
      } else {
        print("the data of updatestatus is " + value.data);
        Utils.snackBar("Error", "Failed to submit status");
      }
    });
  }
}
