import 'package:book_store/src/app/app_export.dart';
import 'package:flutter/material.dart';

void main() {
  // Start app
  RegisterSingletons.registerSingletons();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}
