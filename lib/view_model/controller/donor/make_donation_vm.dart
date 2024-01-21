import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/repository/donor_repository/donor_repository.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/utils/utils.dart';

class DonationVM extends GetxController {
  final _api = DonorRepository();

  final donation_name = TextEditingController().obs;
  final donation_description = TextEditingController().obs;
  final tree_count = TextEditingController().obs;

  RxBool loading = false.obs;

  void donateApi() async {
    loading.value = true;

    Map data = {
      "donation_name": donation_name.value.text,
      "donation_description": donation_description.value.text,
      "tree_count": tree_count.value.text
    };

    print("The data is = ${data.toString()}");

    _api.makeDonationApi(data).then((value) async {
      loading.value = false;
      Get.toNamed(RouteName.donorHome);

      print("the data is " + value.data);
    }).onError((error, stackTrace) {
      loading.value = false;
      // Utils.snackBar("Error", "Failed cache to make donation");
    });
  }
}
