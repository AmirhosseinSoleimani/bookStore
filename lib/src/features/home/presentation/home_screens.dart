import 'package:book_store/src/features/home/presentation/screens/home_screen_small.dart';
import 'package:book_store/src/widgets/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  static const homePagePath = '/home-Page';
  static const homePageName = 'homePage';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        smallScreen: HomeScreenSmall(),
    );
  }
}
