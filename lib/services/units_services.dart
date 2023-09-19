import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class FetchUnits with ChangeNotifier {
  Map<String, dynamic> _map = {};
  Map<String, dynamic> get map => _map;
  bool _error = false;
  bool get error => _error;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> get fetchUnits async {
    final results = await get(Uri.parse(
        'https://dl.dropboxusercontent.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'));
    if (results.statusCode == 200) {
      try {
        _error = false;
        _map = jsonDecode(results.body);
      } catch (e) {
        _error = true;
        _map = {};
        _errorMessage = e.toString();
      }
    } else {
      _error = true;
      _map = {};
      _errorMessage = "Error";
    }
    notifyListeners();
  }

  void initialValues() {
    _error = false;
    _map = {};
    _errorMessage = '';
    notifyListeners();
  }
}
