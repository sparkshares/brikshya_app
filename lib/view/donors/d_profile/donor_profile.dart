import 'package:flutter/material.dart';
import 'package:project_app/models/auth/auth_model.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String name = '';
  String email = '';
  String role = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final userPreference = UserPreference();
    final name = await userPreference.getName();
    final email = await userPreference.getEmail();
    final role = await userPreference.getRole();
    setState(() {
      this.name = name ?? '';
      this.email = email ?? '';
      this.role = role == '0' ? 'Donor' : 'Farmer';
      _nameController.text = this.name;
      _emailController.text = this.email;
    });
  }

  Future<bool> updateUser(String name, String email) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("name", name);
    sp.setString("email", email);
    print("The name is updated, the name is = " +
        sp.getString("name").toString());
    print("The email is updated, the email is = " +
        sp.getString("email").toString());
    return true;
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('edit_profile'.tr),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                bool isUpdated = await updateUser(
                    _nameController.text, _emailController.text);
                if (isUpdated) {
                  loadUser();
                } else {
                  print('Failed to update user data');
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("donor_profile".tr),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _showEditDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildDetailItem('name'.tr, name),
            _buildDetailItem('email'.tr, email),
            _buildDetailItem('phone'.tr, '981380488'),
            _buildDetailItem('role'.tr, role),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () {
                  _showEditDialog(context);
                },
                child: Text(
                  "edit_profile".tr,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
