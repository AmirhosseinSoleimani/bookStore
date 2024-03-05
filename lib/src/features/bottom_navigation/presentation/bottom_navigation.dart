import 'package:book_store/src/features/bottom_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:book_store/src/features/bottom_navigation/presentation/screens/scaffold_with_nested_navigation.dart';
import 'package:book_store/src/features/bottom_navigation/presentation/screens/scaffold_with_nested_navigation_rail.dart';
import 'package:book_store/src/widgets/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          return ResponsiveWidget(
            smallScreen: ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
            ),
            largeScreen: ScaffoldWithNestedNavigationRail(
              navigationShell: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) {
                context.read<BottomNavigationCubit>().updateNavigationIndexState(index);
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            ),
          );
        },
      ),
    );
  }
}



