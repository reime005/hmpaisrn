import 'dart:async';
import 'dart:convert';

import 'package:hmpaisrn/data/autogenerated.dart';
import 'package:http/http.dart' as http;

Future<Autogenerated> fetchPost() async {
  final response = await http
      .get('http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json',headers:{"charset":"utf-8","Accept-Charset":"utf-8"});

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Autogenerated.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}