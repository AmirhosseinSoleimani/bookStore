import 'dart:convert';
import 'package:book_store/src/features/home/domain/book_data.dart';
import 'package:book_store/src/features/home/presentation/screens/home_screen_small.dart';
import 'package:book_store/src/widgets/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatefulWidget {
  static const homePagePath = '/home-Page';
  static const homePageName = 'homePage';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<BookData> bookDataList = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/data.json');
    bookDataList = (json.decode(response) as List).map((item) => BookData.fromJson(item)).toList();
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        smallScreen: HomeScreenSmall(bookDataList: bookDataList.take(20).toList(),),
    );
  }
}
