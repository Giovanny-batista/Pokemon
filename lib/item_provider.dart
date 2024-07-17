import 'package:flutter/material.dart';
import 'item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];
  String _searchQuery = '';

  List<Item> get items {
    if (_searchQuery.isEmpty) {
      return _items;
    } else {
      return _items.where((item) {
        return item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  List<Item> get favoritedItems => _items.where((item) => item.isFavorited).toList();

  void toggleFavoriteStatus(Item item) {
    item.isFavorited = !item.isFavorited;
    notifyListeners();
  }

  void removeFavorite(Item item) {
    item.isFavorited = false;
    notifyListeners();
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1000'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      _items = results.map((json) => Item.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load items');
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  isFavorite(Item item) {}

  void addFavorite(Item item) {}
}
