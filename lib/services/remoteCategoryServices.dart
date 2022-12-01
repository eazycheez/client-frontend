import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/models/categoryModel.dart';
import 'package:http/http.dart' as http;

class RemoteCategoryService {
  Future<List<CategoryModel>?> getCategories() async {
    var client = http.Client();
    var url = Uri.parse('http://localhost:8000/api/category');

    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return categoryModelFromJson(json);
    }
  }
}
