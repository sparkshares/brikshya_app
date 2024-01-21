import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_app/resources/colors/app_color.dart';
import 'package:project_app/view_model/controller/farmer/f_accept_offer.dart';
import 'package:get/get.dart';

class OfferList extends StatelessWidget {
  final String title;
  final String amount;
  final int id;
  final String description;

  OfferList({
    Key? key,
    required this.title,
    required this.id,
    required this.amount,
    required this.description,
  }) : super(key: key);

  FarmerAcceptVM viewModel = Get.put(FarmerAcceptVM());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: Colors.blueAccent, thickness: 2),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildViewDetailButton(context),
                _buildEditButton(context),
                _buildDeleteButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildViewDetailButton(BuildContext context) {
    return Container(
      width: 120,
      child: Text(
        'Rs. ' + amount,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColor.blackBackgroundColor),
      ),
    );
  }

  Container _buildEditButton(BuildContext context) {
    return Container(
      width: 80,
      child: TextButton(
        onPressed: () {
          // Get the ViewModel from the dependency injection system.
          // Call the acceptOfferApi method with the appropriate id.
          viewModel.acceptOfferApi(id); // replace 'id' with the actual id
        },
        child: Text('Accept'),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue,
          side: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  IconButton _buildDeleteButton() {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.black,
      onPressed: () {
        // Delete action
      },
    );
  }

  void _showEditDialog(
      BuildContext context, String title, int subjectId, String description) {
    TextEditingController titlecontroller = TextEditingController(text: title);

    TextEditingController descriptioncontroller =
        TextEditingController(text: description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Subject Name'),
          content: Column(children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                hintText: 'Enter new subject name',
              ),
            ),
            TextField(
              controller: descriptioncontroller,
              decoration: InputDecoration(
                hintText: 'Enter description title',
              ),
            )
          ]),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
