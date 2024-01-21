import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance.ref("test");
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final snapshot = await ref.get();
      if (snapshot.exists) {
        print(snapshot.value);
      } else {
        print('No data available.');
      }
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
