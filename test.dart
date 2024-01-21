import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:project_app/view_model/controller/farmer/farmer_submit_status.dart';

class EditStatusPage extends StatefulWidget {
  final int id;

  EditStatusPage({required this.id});

  @override
  _EditStatusPageState createState() => _EditStatusPageState();
}

class _EditStatusPageState extends State<EditStatusPage> {
  late TextEditingController _statusController;
  late TextEditingController _commentController;
  File? _selectedFile;
  final FarmerSubmitStatusController _farmerSubmitStatusController =
      Get.put(FarmerSubmitStatusController());

  @override
  void initState() {
    super.initState();
    _statusController = TextEditingController();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _statusController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _statusOptions = ['Completed', 'Pending'];

    String? _selectedStatus;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Status'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Text("The status is " + widget.id.toString()),
            SizedBox(height: 20),

            TextField(
              controller: _statusController,
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Comment',
                alignLabelWithHint: true, // Add this line
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Upload Image'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 227, 223, 234),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Selected file: ${_selectedFile?.path ?? "File not selected"}',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_selectedFile != null) {
                  _farmerSubmitStatusController.submitStatusApi(
                    widget.id,
                    _statusController.text,
                    _commentController.text,
                    _selectedFile!,
                  );
                } else {
                  // Show error message
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
