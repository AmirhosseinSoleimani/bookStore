import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/bottom_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final _controller = BottomController(index: 0);

  @override
  Widget build(BuildContext context) {
    final colorTheme =
        AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    return BlocProvider(
      create: (BuildContext context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          return Scaffold(
            body: widget.navigationShell,
            extendBody: true,
            bottomNavigationBar: AnimatedBottomBar(
                bottomController: _controller,
                showLabel: false,
                removeMargins: false,
                bottomBarWidth: 500,
                durationInMilliSeconds: 300,
                bottomBarItems: [
                  BottomBarItem(
                    inActiveItem: (IconManager.home)
                        .iconWidget(color: colorTheme!.colorGreyBox),
                    activeItem: (IconManager.homeFill)
                        .iconWidget(color: colorTheme.accent1),
                    itemLabel: 'Page 1',
                  ),
                  BottomBarItem(
                    inActiveItem: (IconManager.book)
                        .iconWidget(color: colorTheme.colorGreyBox),
                    activeItem: (IconManager.bookFill)
                        .iconWidget(color: colorTheme.accent1),
                    itemLabel: 'Page 2',
                  ),
                  BottomBarItem(
                    inActiveItem: (IconManager.pen)
                        .iconWidget(color: colorTheme.colorGreyBox),
                    activeItem: (IconManager.penFill)
                        .iconWidget(color: colorTheme.accent1),
                    itemLabel: 'Page 3',
                  ),
                  BottomBarItem(
                    inActiveItem: (IconManager.person)
                        .iconWidget(color: colorTheme.colorGreyBox),
                    activeItem: (IconManager.personFill)
                        .iconWidget(color: colorTheme.accent1),
                    itemLabel: 'Page 4',
                  ),
                ],
                onTap: (index) {
                  setState(() {});
                  context
                      .read<BottomNavigationCubit>()
                      .updateNavigationIndexState(index);
                  widget.navigationShell.goBranch(
                    index,
                    initialLocation:
                        index == widget.navigationShell.currentIndex,
                  );
                }),
          );
        },
      ),
    );
  }
}
