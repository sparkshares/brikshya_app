import 'package:flutter/material.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/view/farmers/f_home/widget/f_list.dart';
import 'package:project_app/view_model/controller/farmer/available_donation_vm.dart';
import 'package:project_app/view_model/controller/farmer/f_approved_list.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';
import 'package:get/get.dart';

class FarmerHome extends StatefulWidget {
  const FarmerHome({super.key});

  @override
  State<FarmerHome> createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  UserPreference userPreference = UserPreference();
  final AllAvailableDonationController controller =
      Get.put(AllAvailableDonationController());
  final AllApprovedDonationController controller1 =
      Get.put(AllApprovedDonationController());

  @override
  void initState() {
    super.initState();
    controller.availableDonationListApi();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("plant_a_tree".tr,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                  onPressed: () {
                    userPreference.removeUser().then(
                      (value) {
                        Get.toNamed(RouteName.loginScreen);
                      },
                    );
                  },
                  icon: Icon(Icons.logout)),
              IconButton(
                onPressed: () {
                  Locale currentLocale = Get.locale!;
                  if (currentLocale.languageCode == 'en') {
                    Get.updateLocale(Locale('ne', 'NP'));
                  } else {
                    Get.updateLocale(Locale('en', 'US'));
                  }
                },
                icon: Icon(Icons.language),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueGrey, Colors.green],
                              ),
                              borderRadius: BorderRadius.circular(
                                  10), // This makes the box rounded
                              boxShadow: [
                                // This adds a shadow
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("available_offer".tr,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 20)),
                                FutureBuilder(
                                  future: controller.availableDonationListApi(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // Show a loading spinner while waiting for the data
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Error: ${snapshot.error}'); // Show an error message if something went wrong
                                    } else {
                                      return Text(
                                        "${controller.availableDonationCount}",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 20,
                                        ),
                                      ); // Show the count when the data is loaded
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueGrey, Colors.green],
                              ),
                              borderRadius: BorderRadius.circular(
                                  10), // This makes the box rounded
                              boxShadow: [
                                // This adds a shadow
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("total_count".tr,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                FutureBuilder(
                                  future: controller1.approvedDonationListApi(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // Show a loading spinner while waiting for the data
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Error: ${snapshot.error}'); // Show an error message if something went wrong
                                    } else {
                                      return Text(
                                        "${controller1.approvedDonationCount}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ); // Show the count when the data is loaded
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blueGrey, Colors.green],
                                ),
                                borderRadius: BorderRadius.circular(
                                    10), // This makes the box rounded
                                boxShadow: [
                                  // This adds a shadow
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("wallet_balance".tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  FutureBuilder(
                                    future:
                                        controller1.approvedDonationListApi(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator(); // Show a loading spinner while waiting for the data
                                      } else if (snapshot.hasError) {
                                        return Text(
                                            'Error: ${snapshot.error}'); // Show an error message if something went wrong
                                      } else {
                                        return Text(
                                          "Rs. " +
                                              "${controller1.totalDonationAmount}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ); // Show the total donation amount when the data is loaded
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("view_all_offers".tr,
                          style: TextStyle(color: Colors.black, fontSize: 23)),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(RouteName.farmerAllDonation);
                            },
                            child: Text("view_all".tr)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Obx(() {
                    if (controller.rxRequestStatus.value == Status.LOADING) {
                      return CircularProgressIndicator();
                    } else if (controller.rxRequestStatus.value ==
                        Status.ERROR) {
                      return Text('Error: ${controller.error.value}');
                    } else {
                      return controller.availableDonationList.isEmpty
                          ? Center(
                              child: Text('no_offer_available_right_now'.tr))
                          : Column(
                              children: controller.availableDonationList
                                  .map((donation) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OfferList(
                                      id: donation.id ?? 0,
                                      title: donation.donationName ??
                                          "", // replace with actual field names
                                      description:
                                          donation.donationDescription ?? "",
                                      amount: donation.donationAmount
                                          .toString() // replace with actual field names
                                      ),
                                );
                              }).toList(),
                            );
                    }
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
