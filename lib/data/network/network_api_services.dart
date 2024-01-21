import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:project_app/data/app_exceptions.dart';
import 'package:project_app/data/network/base_api_services.dart';
import 'package:project_app/data/response/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<ApiResponse> getReq(String url) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString("token");
      // print("The url is " + url);
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));

      // print("The response is " + response.body.toString());
      dynamic responseJson = returnResponse(response);

      return ApiResponse.completed(responseJson);
    } on SocketException {
      return ApiResponse.error("No Internet Connection");
    } on TimeoutException {
      return ApiResponse.error("Request Time Out");
    } on FormatException {
      return ApiResponse.error("Invalid Url");
    } catch (e) {
      return ApiResponse.error("Server Error");
    }
  }

  @override
  Future<ApiResponse> postMultipart(http.MultipartRequest request) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token =
          sp.getString("token"); // Retrieve the token from SharedPreferences

      // Add the token to the headers
      request.headers.addAll({'Authorization': 'Bearer $token'});

      final response =
          await request.send().timeout(const Duration(seconds: 150));

      // Get the response body
      final respStr = await response.stream.bytesToString();

      // Convert the response to http.Response
      http.Response httpResponse = http.Response(respStr, response.statusCode);

      // Use returnResponse to handle the response
      dynamic responseJson = returnResponse(httpResponse);

      return ApiResponse.completed(responseJson);
    } on SocketException {
      return ApiResponse.error("No Internet connection");
    } on RequestTimeOut {
      return ApiResponse.error("Request timed out");
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse> putReq(dynamic data, String url) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString("token");

      final response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));

      dynamic responseJson = returnResponse(response);
      return ApiResponse.completed(responseJson);
    } on SocketException {
      return ApiResponse.error("No Internet Connection");
    } on TimeoutException {
      return ApiResponse.error("Request Time Out");
    } on FormatException {
      return ApiResponse.error("Invalid Url");
    } catch (e) {
      return ApiResponse.error("Server Error");
    }
  }

  @override
  Future<ApiResponse> deleteReq(String url) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString("token");

      final response = await http.delete(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));

      dynamic responseJson = returnResponse(response);
      return ApiResponse.completed(responseJson);
    } on SocketException {
      return ApiResponse.error("No Internet Connection");
    } on TimeoutException {
      return ApiResponse.error("Request Time Out");
    } on FormatException {
      return ApiResponse.error("Invalid Url");
    } catch (e) {
      return ApiResponse.error("Server Error");
    }
  }

  @override
  Future<ApiResponse> postReq(dynamic data, String url) async {
    print("the data at network is " + data.toString());
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString("token");

      http.Response response;

      if (data['image_path'] != null) {
        // Handle image upload
        final request = http.MultipartRequest('POST', Uri.parse(url));

        if (!url.contains('register') && !url.contains('login')) {
          request.headers.addAll({
            'Authorization': 'Bearer $token',
          });
        }

        request.fields['status'] = data['status'];
        request.fields['comments'] = data['comments'];

        request.files.add(await http.MultipartFile.fromPath(
          'image_path',
          data['image_path'].path,
          contentType: MediaType('image', 'jpeg'),
        ));

        final streamedResponse =
            await request.send().timeout(const Duration(seconds: 10));
        response = await http.Response.fromStream(streamedResponse);
      } else {
        // Handle normal POST request
        response = await http
            .post(
              Uri.parse(url),
              body: jsonEncode(data),
              headers: !url.contains('register') && !url.contains('login')
                  ? {
                      'Authorization': 'Bearer $token',
                      'Content-Type': 'application/json',
                    }
                  : {'Content-Type': 'application/json'},
            )
            .timeout(const Duration(seconds: 10));
      }

      print("The response is " + response.body.toString());
      dynamic responseJson = returnResponse(response);

      return ApiResponse.completed(responseJson);
    } on SocketException {
      return ApiResponse.error("No Internet Connection");
    } on TimeoutException {
      return ApiResponse.error("Request Time Out");
    } on FormatException {
      return ApiResponse.error("Invalid Url");
    } catch (e) {
      return ApiResponse.error("Server Error");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode' +
                response.statusCode.toString());
    }
  }
}
