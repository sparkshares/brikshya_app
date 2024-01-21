import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_app/view/donors/d_detail/d_detail.dart';
import 'package:get/get.dart';

class d_list extends StatelessWidget {
  final String title;
  final String description;
  final String amount;
  final String image;
  final String comment;
  final String status;

  d_list({
    Key? key,
    required this.title,
    required this.description,
    required this.amount,
    required this.image,
    required this.comment,
    required this.status,
  }) : super(key: key);

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
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
              ),
            ),
            Text(
              'Amount : Rs. $amount',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildViewDetailButton(context),
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
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SummaryDetail(
                title: title,
                description: description,
                amount: amount,
                image: image,
                comment: comment,
                status: status,
              ),
            ),
          );
        },
        child: Text('View detail'.tr),
        style: TextButton.styleFrom(
          primary: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
}
