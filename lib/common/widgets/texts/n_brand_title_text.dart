import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/enums.dart';

class NBrandTitleText extends StatelessWidget {
  const NBrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,

      style:
          brandTextSize == TextSizes.small
              ? TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 10,
                color: color,
              )
              : brandTextSize == TextSizes.medium
              ? TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 15,
                color: color,
              )
              : brandTextSize == TextSizes.large
              ? TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 18,
                color: color,
              )
              : TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 10,
                color: color,
              ),
    );
  }
}
