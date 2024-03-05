import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/home/domain/book_data.dart';
import 'package:book_store/src/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenSmall extends StatelessWidget {
  const HomeScreenSmall({super.key, required this.bookDataList});
  final List<BookData> bookDataList;

  @override
  Widget build(BuildContext context) {
    final string = AppLocalizations.of(context);
    final colorTheme =
    AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          width: double.infinity,
          height: AppSize.s420,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorTheme!.primaryColor!.withOpacity(0.1),
                colorTheme.accent1!.withOpacity(0.6),
              ]
            )
          ),
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (string.newTrending).toLabel(textStyle: textTheme!.mobileBold16.copyWith(color: colorTheme.darkBrown, fontSize: AppSize.s20)),
                (string.newTrendingText).toLabel(textStyle: textTheme.mobileRegular14.copyWith(color: colorTheme.darkBrown, fontSize: AppSize.s16)),
                AppSize.s8.heightSizeBox(),
                SizedBox(
                  height: AppSize.s300,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 1.4
                      ),
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: bookDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: SizedBox(
                            width: AppSize.s42,
                            child: CachedNetworkImage(
                              imageUrl: "${AppConstants.imageBaseUrl}${bookDataList[index].imageLink!}",
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(colorTheme.colorGreyBox!, BlendMode.colorBurn)),
                                  ),
                                ),
                              placeholder: (context, url) => SpinKitWidget(color: colorTheme.colorGreyBox, size: AppSize.s28,),
                              errorWidget: (context, url, error) => (IconManager.errorPhoto).iconWidget(color: colorTheme.colorGreyBox, size: AppSize.s42),
                            ).paddingSymmetric(horizontal: AppPadding.p4),
                          ),
                        );
                      },
                  ),
                ),
                AppSize.s8.heightSizeBox(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (string.seeAll).toLabel(textStyle: textTheme.mobileRegular14.copyWith(color: colorTheme.darkBrown)),
                      (IconManager.chevronRight).iconWidget(size: AppSize.s18, color: colorTheme.darkBrown)
                    ],
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: AppPadding.p16),
          ),
        )
      ],
    );
  }
}
