import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/view/farmers/f_approved_list/edit_page_status.dart';
import 'package:project_app/view/farmers/f_detail/f_detail.dart';
import 'package:project_app/view_model/controller/farmer/f_approved_list.dart';

class ApprovedList extends StatefulWidget {
  const ApprovedList({Key? key}) : super(key: key);

  @override
  _ApprovedListState createState() => _ApprovedListState();
}

class _ApprovedListState extends State<ApprovedList> {
  final AllApprovedDonationController controller =
      Get.put(AllApprovedDonationController());

  @override
  void initState() {
    super.initState();
    controller.approvedDonationListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('approved_list'.tr),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                controller.approvedDonationListApi();
              },
            ),
          ],
        ),
        body: Obx(() {
          if (controller.rxRequestStatus.value == Status.LOADING) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.rxRequestStatus.value == Status.ERROR) {
            return Center(child: Text('Error: ${controller.error.value}'));
          } else {
            if (controller.approvedDonationList.isEmpty) {
              return Center(child: Text('No approved plantation found.'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: controller.approvedDonationList.length,
                  itemBuilder: (context, index) {
                    var sortedList = List.from(controller.approvedDonationList);
                    sortedList
                        .sort((a, b) => b.createdAt.compareTo(a.createdAt));
                    var donation = sortedList[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donation.donationName ?? "",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Rs. ${donation.donationAmount} ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${donation.donationDescription}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FarmerDetail(
                                            title: donation.donationName ?? "",
                                            description:
                                                donation.donationDescription ??
                                                    "",
                                            amount:
                                                donation.donationAmount ?? 0,
                                            image: donation
                                                    .treeDonationStatusImagePath ??
                                                "",
                                            comment: donation
                                                    .treeDonationStatusComments ??
                                                "",
                                            date: donation.createdAt ?? "",
                                            status: donation
                                                    .treeDonationStatusStatus ??
                                                "",
                                          ),
                                        ));
                                  },
                                  child: Text('view_detail'.tr),
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    onSurface: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => EditStatusPage(
                                          id: donation.treeDonationStatusId ??
                                              0),
                                    ));
                                  },
                                  child: Text('edit_status'.tr),
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    onSurface: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        }));
  }
}
