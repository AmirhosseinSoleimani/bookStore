import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/features/features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const splashPageName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future goToPage() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    goToPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            context.go(HomeScreen.homePagePath);
          },
          child: Text('SplashScreen')).center,
    );
  }
}
