import 'package:flutter/material.dart';
import '../domain/page_data_entity.dart';


class PageImage extends StatelessWidget {
  const PageImage({super.key, required this.data});

  final PageDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/images/_common/intro-${data.img}.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
        ),
        Positioned.fill(
            child: Image.asset(
              'assets/images/_common/intro-mask-${data.mask}.png',
              fit: BoxFit.fill,
            )),
      ],
    );
  }
}