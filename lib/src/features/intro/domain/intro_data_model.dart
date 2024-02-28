import 'package:book_store/src/features/intro/domain/page_data_entity.dart';

class IntroDataModel {
  static const double imageSize = 250;
  static const double logoHeight = 126;
  static const double textHeight = 110;
  static const double pageIndicatorHeight = 55;

  static List<PageDataEntity> pageData = [
    const PageDataEntity('Journey to the past', 'Navigate the intersection of time, art, and culture.', 'camel', '1'),
    const PageDataEntity('Explore places', 'Uncover remarkable human-made structures from around the world.', 'petra', '2'),
    const PageDataEntity('Discover artifacts', 'Learn about cultures throughout time by examining things they left behind.', 'statue', '3'),
  ];
}
