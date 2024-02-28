import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/intro/presentation/screens/book_store_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../widgets/buttons/app_button.dart';


class HomeScreen extends StatelessWidget {
  static const homePageName = '/home_page';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
