import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/logic/common/platform_info.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/authentication/presentation/starter_page/view/starter_page_screen.dart';
import 'package:book_store/src/features/intro/domain/intro_data_model.dart';
import 'package:book_store/src/features/intro/presentation/screens/book_store_logo.dart';
import 'package:book_store/src/features/intro/presentation/screens/page_data.dart';
import 'package:book_store/src/features/intro/presentation/screens/page_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:book_store/src/core/logic/app_haptics.dart';
import 'package:book_store/src/widgets/animations/app_page_indicator.dart';
import 'package:book_store/src/widgets/animations/gradient_container.dart';
import 'package:book_store/src/widgets/buttons/buttons.dart';
import 'package:book_store/src/widgets/extra_align.dart';
import 'package:book_store/src/widgets/text/text.dart';
import 'screens/previous_next_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroScreen extends StatefulWidget {
  static const introPageName = '/intro_page';
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final PageController _pageController = PageController()..addListener(_handlePageChanged);
  late final ValueNotifier<int> _currentPage = ValueNotifier(0)
    ..addListener(() => setState(() {}));

  bool get _isOnLastPage => _currentPage.value.round() == IntroDataModel.pageData.length - 1;

  bool get _isOnFirstPage => _currentPage.value.round() == 0;

  void _handleIntroCompletePressed() {
    if (_currentPage.value == IntroDataModel.pageData.length - 1) {
      context.go(StarterPageScreen.starterPageName);
    }
  }

  void _handlePageChanged() {
    int newPage = _pageController.page?.round() ?? 0;
    _currentPage.value = newPage;
  }

  void _handleSemanticSwipe(int dir) {
    _pageController.animateToPage((_pageController.page ?? 0).round() + dir,
        duration: AppTimes().t300, curve: Curves.easeOut);
  }

  void _handleNavTextSemanticTap() => _incrementPage(1);

  void _incrementPage(int dir) {
    final int current = _pageController.page!.round();
    if (_isOnLastPage && dir > 0) return;
    if (_isOnFirstPage && dir < 0) return;
    _pageController.animateToPage(current + dir,
        duration: 250.ms, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme =
        AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    final List<Widget> pages = IntroDataModel.pageData.map((e) => PageData(data: e)).toList();
    return DefaultTextColor(
      color: colorTheme!.offWhite!,
      child: ColoredBox(
        color: colorTheme.colorBlack!,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: colorTheme.colorBlack!,
            body: Animate(
              delay: 500.ms,
              effects: const [FadeEffect()],
              child: PreviousNextNavigation(
                maxWidth: 600,
                nextBtnColor: _isOnLastPage ? colorTheme.accent1 : null,
                onPreviousPressed:
                    _isOnFirstPage ? null : () => _incrementPage(-1),
                onNextPressed: () {
                  if (_isOnLastPage) {
                    _handleIntroCompletePressed();
                  } else {
                    _incrementPage(1);
                  }
                },
                child: Stack(children: [
                  MergeSemantics(
                    child: Semantics(
                      onIncrease: () => _handleSemanticSwipe(1),
                      onDecrease: () => _handleSemanticSwipe(-1),
                      child: PageView(
                        controller: _pageController,
                        children: pages,
                        onPageChanged: (_) => AppHaptics.lightImpact(),
                      ),
                    ),
                  ),
                  ExcludeSemantics(
                    child: Column(children: [
                      const Spacer(),
                      // logo:
                      Semantics(
                        header: true,
                        child: Container(
                          height: IntroDataModel.logoHeight,
                          alignment: Alignment.center,
                          child: const BookStoreLogo(),
                        ),
                      ),
                      SizedBox(
                        height: IntroDataModel.imageSize,
                        width: IntroDataModel.imageSize,
                        child: ValueListenableBuilder<int>(
                          valueListenable: _currentPage,
                          builder: (_, value, __) {
                            return AnimatedSwitcher(
                              duration: AppTimes().t900,
                              child: KeyedSubtree(
                                key: ValueKey(value),
                                child: PageImage(data: IntroDataModel.pageData[value]),
                              ),
                            );
                          },
                        ),
                      ),
                      IntroDataModel.textHeight.heightSizeBox(),
                      Container(
                        height: IntroDataModel.pageIndicatorHeight,
                        alignment: const Alignment(0.0, 0.0),
                        child: AppPageIndicator(
                            count: IntroDataModel.pageData.length,
                            controller: _pageController,
                            color: colorTheme.whiteColor),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ]),
                  ),
                  _buildHzGradientOverlay(left: true, context: context),
                  _buildHzGradientOverlay(context: context),
                  if (PlatformInfo.isMobile) ...[
                    Positioned(
                      right: AppStyle().insets.lg,
                      bottom: AppStyle().insets.lg,
                      child: _buildFinishBtn(context, _currentPage, IntroDataModel.pageData,
                          _handleIntroCompletePressed),
                    ),
                    BottomCenter(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: AppStyle().insets.lg),
                        child: _buildNavText(context, _currentPage, IntroDataModel.pageData,
                            _isOnLastPage, _handleNavTextSemanticTap),
                      ),
                    )
                  ]
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildNavText(BuildContext context, ValueNotifier<int> currentPage,
    List pageData, bool isOnLastPage, VoidCallback handleNavTextSemanticTap) {
  final textTheme =
  AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
  return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
          opacity: pageIndex == pageData.length - 1 ? 0 : 1,
          duration: AppTimes().t300,
          child: Semantics(
            onTapHint: AppLocalizations.of(context).navigate,
            onTap: isOnLastPage ? null : handleNavTextSemanticTap,
            child: (AppLocalizations.of(context).swipeToContinue).toLabel(textStyle: textTheme!.mobileBold16),
          ),
        );
      });
}

Widget _buildFinishBtn(BuildContext context, ValueNotifier<int> currentPage,
    List pageData, VoidCallback handleIntroCompletePressed) {
  final colorTheme =
      AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
          opacity: pageIndex == pageData.length - 1 ? 1 : 0,
          duration: AppTimes().t300,
          child: CircleIconButton(
              color: colorTheme!.whiteColor,
              icon: IconManager.next,
              bgColor: colorTheme.accent1!,
              onPressed: handleIntroCompletePressed,
              semanticLabel: AppLocalizations.of(context).enterTheApp),
        );
      });
}

Widget _buildHzGradientOverlay(
    {bool left = false, required BuildContext context}) {
  final colorTheme =
      AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  return Align(
    alignment: Alignment(left ? -1.0 : 1.0, 0.0),
    child: FractionallySizedBox(
      widthFactor: 0.5,
      child: Padding(
        padding: EdgeInsets.only(left: left ? 0 : 200, right: left ? 200 : 0),
        child: Transform.scale(
          scaleX: left ? -1 : 1,
          child: HzGradient([
            colorTheme!.colorBlack!.withOpacity(0),
            colorTheme.colorBlack!,
          ], const [
            0,
            .2
          ]),
        ),
      ),
    ),
  );
}
