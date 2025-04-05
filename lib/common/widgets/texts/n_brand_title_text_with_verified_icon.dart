import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/enums.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBransTitleWithVerifiedIcon extends StatelessWidget {
  const NBransTitleWithVerifiedIcon({
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: NBrandTitleText(
            title: title,
            textAlign: textAlign,
            maxLines: maxLines,
            color: color,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: NSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: NColors.primary,
          size: NSizes.iconXs,
        ),
      ],
    );
  }
}
