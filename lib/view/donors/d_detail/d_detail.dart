import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_app/resources/url/app_url.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:project_app/view/chatbot/chat_page.dart';

class SummaryDetail extends StatelessWidget {
  final String title;
  final String description;
  final String amount;
  final String image;
  final String comment;
  final String status;

  SummaryDetail({
    required this.title,
    required this.description,
    required this.amount,
    required this.image,
    required this.comment,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // Split the summary into paragraphs
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
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
              SizedBox(height: 16),
              Text(
                'Your Donation : Rs. $amount',
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
                  return const Text('Status : Image is not assigned yet.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
                },
              ),
              SizedBox(height: 30),
              Text(
                'Comment: ${comment?.isEmpty ?? true ? 'No comment provided' : comment}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Status: ${status?.isEmpty ?? true ? 'No status provided' : status}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              if (!(status?.isEmpty ?? true)) ...[
                Text(
                  'Your Tree lies here: ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 300, // Adjust this as needed
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(26.7926522, 87.2919745),
                      zoom: 14.4746,
                    ),
                  ),
                ),
              ] else
                Container(), // Replace this with the widget you want to display when the condition is not met          ],
            ],
          ),
        ));
  }
}
