import 'package:book_store/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final container = ProviderContainer(
  );
  runApp(
      UncontrolledProviderScope(
          container: container,
          child: const MyApp(),
      ),
  );
  WidgetsFlutterBinding.ensureInitialized();
}
