
import 'package:book_store/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:book_store/src/app/app_export.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookStoreScaffold extends StatelessWidget {
  const BookStoreScaffold({super.key});

  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();



  @override
  Widget build(BuildContext context) {

    /// listen to the device size
    final mq = MediaQuery.of(context);
    RegisterSingletons.appLogic.handleAppSizeChanged(mq.size);
    Animate.defaultDuration = _style.times.fast;

    /// Create a style object
    // _style = AppStyle(screenSize: context);

    return const Placeholder();
  }
}
