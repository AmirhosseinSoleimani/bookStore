import 'package:json_annotation/json_annotation.dart';

part 'book_data.g.dart';

@JsonSerializable()
class BookData {
  final String? title, author, imageLink, language, link, country;
  final int? year, pages;
  const BookData({this.title, this.author, this.imageLink, this.language, this.link, this.country, this.year, this.pages});

  factory BookData.fromJson(Map<String, dynamic> json) => _$BookDataFromJson(json);


}