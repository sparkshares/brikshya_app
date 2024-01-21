import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/components/round_button.dart';
import 'package:project_app/resources/routes/routes.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/donor/make_donation_vm.dart';

class DonateMoneyPage extends StatefulWidget {
  @override
  State<DonateMoneyPage> createState() => _DonateMoneyPageState();
}

class _DonateMoneyPageState extends State<DonateMoneyPage> {
  final donateVM = Get.put(DonationVM());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate_money'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "your_donation_giving_new_life".tr,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text("Fill in the details", style: TextStyle(fontSize: 19)),
                    SizedBox(height: 5.0),
                    TextField(
                      controller: donateVM.donation_name.value,
                      decoration: InputDecoration(
                        labelText: "Donation Title",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: donateVM.donation_description.value,
                      decoration: InputDecoration(
                        labelText: "Donation Message",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: donateVM.tree_count.value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "No. of Trees",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(height: 16.0),
              Obx(() {
                return ElevatedButton(
                  child: Text("pay_amount".tr, style: TextStyle()),
                  onPressed: donateVM.loading.value
                      ? null
                      : () async {
                          int totalTrees =
                              int.tryParse(donateVM.tree_count.value.text) ?? 0;
                          int liveValue = totalTrees * 99;
                          bool? shouldProceed = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmation'),
                                content: Text(
                                    'The amount is Rs. $liveValue. Are you sure you want to pay?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Yes'),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          if (shouldProceed == true) {
                            donateVM.donateApi();
                            donateVM.donation_description.value.clear();
                            donateVM.donation_name.value.clear();
                            donateVM.tree_count.value.clear();
                          }
                        },
                );
              }),
              SizedBox(height: 46.0),
              Center(
                child: Column(
                  children: <Widget>[
                    // Existing widgets...
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "We support payment via eSewa and Khalti",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            // Handle eSewa payment
                          },
                          child: Text("Pay with eSewa"),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            // Handle Khalti payment
                          },
                          child: Text("Pay with Khalti"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle Khalti payment
  void _handlePayment(BuildContext context) {}
}
