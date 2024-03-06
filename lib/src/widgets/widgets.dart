import 'package:book_store/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.iconData, this.size, this.color});
  final IconData iconData;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}

class SpinKitWidget extends StatelessWidget {
  const SpinKitWidget({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color,
      size: size ?? AppSize.s28,
    );
  }
}


