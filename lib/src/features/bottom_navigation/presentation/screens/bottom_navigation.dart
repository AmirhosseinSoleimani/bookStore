import 'package:bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/bottom_navigation_cubit.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  static const bottomNavigationBarPageName = '/';
  BottomNavigationBarScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;


  final _controller = BottomController(index: 0);
  final int maxCount = 4;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          return Scaffold(
            body: navigationShell,
            extendBody: true,
            bottomNavigationBar: AnimatedBottomBar(
                bottomController: _controller,
                color: Colors.white,
                showLabel: false,
                removeMargins: false,
                bottomBarWidth: 500,
                durationInMilliSeconds: 300,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    itemLabel: 'Page 2',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.star,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.star,
                      color: Colors.blueAccent,
                    ),
                    itemLabel: 'Page 2',
                  ),
                  ///svg example
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    itemLabel: 'Page 3',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.settings,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.settings,
                      color: Colors.pink,
                    ),
                    itemLabel: 'Page 4',
                  ),
                ],
                onTap: (index) {
                  navigationShell.goBranch(
                    index,
                    initialLocation: index == navigationShell.currentIndex,
                  );
                  context.read<BottomNavigationCubit>().updateNavigationIndexState(index);
                }),
          );
        },
      ),
    );
  }
}
