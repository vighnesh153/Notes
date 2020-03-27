import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  static const URL = 'https://flutter-tutorials-153.firebaseio.com/';
  static const DB_NAME = 'products';

  void _setFavouriteValue(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavouriteStatus() async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();

    try {
      final url = URL + DB_NAME + '/$id.json';
      final response = await http.patch(url,
          body: json.encode({
            'isFavourite': isFavourite,
          }));

      if (response.statusCode >= 400) {
        _setFavouriteValue(oldStatus);
      }
    } catch (error) {
      // although, network errors can be thrown in
      // all action verbs type of requests.
      _setFavouriteValue(oldStatus);
    }
  }

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });
}
