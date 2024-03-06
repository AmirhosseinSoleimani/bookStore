import 'dart:convert';
import 'package:book_store/src/app/app_export.dart';
import 'package:book_store/src/features/home/domain/book_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  // Start app
  RegisterSingletons.registerSingletons();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  readJson();
}

Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/json/data.json');
  final List<BookData> data = (json.decode(response) as List)
      .map((item) => BookData.fromJson(item))
      .toList();
}