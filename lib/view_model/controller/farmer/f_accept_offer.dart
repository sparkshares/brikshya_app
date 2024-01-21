import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/repository/farmer_repository/farmer_repository.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/farmer/available_donation_vm.dart';

class FarmerAcceptVM extends GetxController {
  AllAvailableDonationController controller =
      Get.put(AllAvailableDonationController());

  final _api = FarmerRepository();
  final loading = false.obs;

  void acceptOfferApi(int id) {
    loading.value = true;

    Map data = {"tree_trans_id": id, "status": "true"};

    _api.acceptOfferApi(data).then((value) async {
      loading.value = false;

      if (value.data != null) {
        await controller.availableDonationListApi();
        Utils.snackBar("Success", "Offer Accepted");
      } else {
        Utils.snackBar("Error", "Failed to accept offer");
      }
    });
  }
}
