import 'dart:convert';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  List<Map<String, dynamic>> productData = [];
 static List<String> thum = [];
 static List<String> thum2 = [];

   Future<void> fetchData() async {
    //final url=Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    print(response);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData.containsKey('products')) {
        productData = List<Map<String, dynamic>>.from(jsonData['products']);


        for (var product in productData) {
          thum.add(product['thumbnail']);

          for (var imageUrl in product['images']) {
            if (!imageUrl.contains('thumbnail')) {
              thum2.add(imageUrl);
            }
          }
        }
      }
    }
  }
}

List<Map<String, dynamic>> photoData = [];

Future<void> fetchPhoto() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);

    photoData =
        jsonData.map((data) => Map<String, dynamic>.from(data)).toList();

    for (var photo in photoData) {
      // print('Album ID: ${photo['albumId']}');
      // print('Photo ID: ${photo['id']}');
      // print('Title: ${photo['title']}');
      // print('URL: ${photo['url']}');
      // print('Thumbnail URL: ${photo['thumbnailUrl']}');
      // print('-----------------------');
    }

    print('Fetched ${photoData.length} photos');
  } else {
    throw Exception('Failed to load data');
  }
}

class Product {
  int id;
  String title;
  String thumbnail;

  Product({required this.id, required this.title, required this.thumbnail});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
