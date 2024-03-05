// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookData _$BookDataFromJson(Map<String, dynamic> json) => BookData(
      title: json['title'] as String?,
      author: json['author'] as String?,
      imageLink: json['imageLink'] as String?,
      language: json['language'] as String?,
      link: json['link'] as String?,
      country: json['country'] as String?,
      year: json['year'] as int?,
      pages: json['pages'] as int?,
    );

Map<String, dynamic> _$BookDataToJson(BookData instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'imageLink': instance.imageLink,
      'language': instance.language,
      'link': instance.link,
      'country': instance.country,
      'year': instance.year,
      'pages': instance.pages,
    };
