import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Label extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const Label(this.title, {this.textStyle, this.textAlign, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  const ImageWidget({required this.path, Key? key, this.color, this.width, this.height, this.boxFit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.fill,
      color: color,
      width: width,
      height: height,
    );
  }
}

class SvgPictureWidget extends StatelessWidget {
  const SvgPictureWidget({super.key, required this.path, this.height, this.width, this.color});
  final String path;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
        width: width,
        height: height,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

