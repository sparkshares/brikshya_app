import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_app/resources/url/app_url.dart';
import 'dart:math';

import 'package:project_app/view/chatbot/chat_page.dart';

class FarmerDetail extends StatelessWidget {
  final String title;
  final String description;
  final int amount;
  final String image;
  final String date;
  final String comment;
  final String status;

  FarmerDetail({
    required this.title,
    required this.description,
    required this.amount,
    required this.image,
    required this.date,
    required this.comment,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Detail'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Created at: ' +
                  DateFormat('dd MMM yyyy').format(DateTime.parse(date)),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Rs. $amount',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Image.network(
              '${AppUrl.baseUrl}$image',
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Image is not posted yet.');
              },
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 19),
            ),
            Text(
              'Comment: $comment',
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}
