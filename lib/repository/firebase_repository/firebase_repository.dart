import 'package:flutter/material.dart';
import 'package:project_app/data/network/network_api_services.dart';
import 'package:project_app/models/firebase_data/firebase_data.dart';
import 'package:project_app/resources/routes/routes.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/resources/url/app_url.dart';

class FirebaseRepository {
  final _apiService = NetworkApiServices();

  Future<FirebaseData> getFirebaseData() async {
    final response = await _apiService.getReq(AppUrl.getFirebaseDataApi());
    if (response.data != null) {
      return FirebaseData.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch data from Firebase');
    }
  }
}
