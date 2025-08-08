import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  final Color? color;
  final double? height;
  final double? width;
  final String _assetPath = 'lib/assets/images/';

  AppImages({
    this.height,
    this.width,
    this.color,
  });

  SvgPicture _getSvg(String name) => SvgPicture.asset(
        '$_assetPath$name',
        color: color,
        height: height,
        width: width,
      );

  SvgPicture get backArrow => _getSvg('back_arrow.svg');
  SvgPicture get expandIcon => _getSvg('expand_less.svg');
  SvgPicture get collapseIcon => _getSvg('expand_more.svg');
  SvgPicture get calendarIcon => _getSvg('calander_icon.svg');
}
