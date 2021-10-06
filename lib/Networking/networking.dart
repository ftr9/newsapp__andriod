import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fetchNews {
  Future FetchCategory(String url) async {
    var decoded = await http.get(Uri.parse(url));
    var result = jsonDecode(decoded.body);
    if (result["status"] == "ok") {
      return result;
    } else {
      return "Failed to fetch the news try again";
    }
  }

  Future FetchOwn(String url) async {
    var decoded = await http.get(Uri.parse(url));
    var result = jsonDecode(decoded.body);
    if (result["status"] == "ok") {
      return result;
    } else {
      return "Failed to fetch the news try again";
    }
  }
}
