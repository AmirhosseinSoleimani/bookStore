import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigationRail extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const ScaffoldWithNestedNavigationRail(
      {super.key,
        required this.navigationShell,
        required this.selectedIndex,
        required this.onDestinationSelected,
      });


  @override
  Widget build(BuildContext context) {
    final colorTheme =
    AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: (IconManager.home)
                      .iconWidget(color: colorTheme!.colorGreyBox),
                  selectedIcon:
                  (IconManager.homeFill).iconWidget(color: colorTheme.accent1),
                  label: const Text('Home'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.book)
                      .iconWidget(color: colorTheme.colorGreyBox),
                  selectedIcon:
                  (IconManager.bookFill).iconWidget(color: colorTheme.accent1),
                  label: const Text('Library'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.pen)
                      .iconWidget(color: colorTheme.colorGreyBox),
                  selectedIcon:
                  (IconManager.penFill).iconWidget(color: colorTheme.accent1),
                  label: const Text('Write'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.person)
                      .iconWidget(color: colorTheme.colorGreyBox),
                  selectedIcon:
                  (IconManager.personFill).iconWidget(color: colorTheme.accent1),
                  label: const Text('Profile'),
                )

              ],
              onDestinationSelected: onDestinationSelected,
              labelType: NavigationRailLabelType.all,
            ),
            VerticalDivider(
              thickness: AppSize.s1,
              width: AppSize.s1,
              color: colorTheme.colorGreyBox,
            ),
            Expanded(
              child: navigationShell,
            )
          ],
        ));
  }
}