import 'package:book_store/src/app/app_export.dart';
import 'package:book_store/src/app/register_singletons.dart';
import 'package:book_store/src/core/logic/common/platform_info.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/intro/domain/intro_size_model.dart';
import 'package:book_store/src/features/intro/domain/page_data_entity.dart';
import 'package:book_store/src/features/intro/screens/book_store_logo.dart';
import 'package:book_store/src/features/intro/screens/page_data.dart';
import 'package:book_store/src/features/intro/screens/page_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/logic/app_haptics.dart';
import '../../widgets/animations/app_page_indicator.dart';
import '../../widgets/animations/gradient_container.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/extra_align.dart';
import '../../widgets/text/text.dart';
import 'screens/previous_next_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


  static List<PageDataEntity> pageData = [];

  late final PageController _pageController = PageController()
    ..addListener(_handlePageChanged);
  late final ValueNotifier<int> _currentPage = ValueNotifier(0)
    ..addListener(() => setState(() {}));

  bool get _isOnLastPage => _currentPage.value.round() == pageData.length - 1;

  bool get _isOnFirstPage => _currentPage.value.round() == 0;

  void _handleIntroCompletePressed() {
    if (_currentPage.value == pageData.length - 1) {
      // context.go(ScreenPaths.home);
      // settingsLogic.hasCompletedOnboarding.value = true;
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
    final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    pageData = [
      const PageDataEntity('Journey to the past',
          'Navigate the intersection of time, art, and culture.', 'camel', '1'),
      const PageDataEntity(
          'Explore places',
          'Uncover remarkable human-made structures from around the world.',
          'petra',
          '2'),
      const PageDataEntity(
          'Discover artifacts',
          'Learn about cultures throughout time by examining things they left behind.',
          'statue',
          '3'),
    ];
    final List<Widget> pages = pageData.map((e) => PageData(data: e)).toList();
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
                  IgnorePointer(
                    ignoringSemantics: false,
                    child: Column(children: [
                      const Spacer(),
                      // logo:
                      Semantics(
                        header: true,
                        child: Container(
                          height: IntroSizeModel.logoHeight,
                          alignment: Alignment.center,
                          child: const BookStoreLogo(),
                        ),
                      ),
                      SizedBox(
                        height: IntroSizeModel.imageSize,
                        width: IntroSizeModel.imageSize,
                        child: ValueListenableBuilder<int>(
                          valueListenable: _currentPage,
                          builder: (_, value, __) {
                            return AnimatedSwitcher(
                              duration: AppTimes().t900,
                              child: KeyedSubtree(
                                key: ValueKey(value),
                                child: PageImage(data: pageData[value]),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: IntroSizeModel.textHeight,
                      ),
                      Container(
                        height: IntroSizeModel.pageIndicatorHeight,
                        alignment: const Alignment(0.0, 0.0),
                        child: AppPageIndicator(
                            count: pageData.length, controller: _pageController, color: colorTheme.offWhite),
                      ),
                      const Spacer(flex: 2,),
                    ]),
                  ),
                  _buildHzGradientOverlay(left: true, context: context),
                  _buildHzGradientOverlay(context: context),
                  if(PlatformInfo.isMobile) ...[
                    Positioned(
                        right: RegisterSingletons.$styles.insets.lg,
                        bottom: RegisterSingletons.$styles.insets.lg,
                        child: _buildFinishBtn(context, _currentPage, pageData, _handleIntroCompletePressed),
                    ),
                    BottomCenter(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: RegisterSingletons.$styles.insets.lg),
                        child: _buildNavText(context, _currentPage, pageData, _isOnLastPage, _handleNavTextSemanticTap),
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

Widget _buildNavText(BuildContext context, ValueNotifier<int> currentPage, List pageData, bool isOnLastPage, VoidCallback handleNavTextSemanticTap) {
  return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
          opacity: pageIndex == pageData.length - 1 ? 0 : 1,
          duration: AppTimes().t300,
          child: Semantics(
            onTapHint: 'Navigate',
            onTap: isOnLastPage ? null : handleNavTextSemanticTap,
            child: const Text('Swipe left to continue'),
          ),
        );
      });
}


Widget _buildFinishBtn(BuildContext context, ValueNotifier<int> currentPage, List pageData, VoidCallback handleIntroCompletePressed) {
  final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
            opacity: pageIndex == pageData.length - 1 ? 1 : 0,
            duration: AppTimes().t300,
          child: CircleIconButton(
            icon: IconManager.next,
            bgColor: colorTheme!.accent1!,
            onPressed: handleIntroCompletePressed,
            semanticLabel: AppLocalizations.of(context).enterTheApp
          ),
        );
      });
}


Widget _buildHzGradientOverlay({bool left = false, required BuildContext context}) {
  final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  return Align(
    alignment: Alignment(left? -1.0 : 1.0, 0.0),
    child: FractionallySizedBox(
      widthFactor: 0.5,
      child: Padding(
        padding: EdgeInsets.only(left: left ? 0 : 200, right: left ? 200 : 0),
        child: Transform.scale(
          scaleX: left ? -1 : 1,
          child: HzGradient(
            [colorTheme!.colorBlack!.withOpacity(0),
              colorTheme.colorBlack!,
            ],
            const [0,.2]
          ),
        ),
      ),
    ),
  );
}



