import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';

class NHomeCategories extends StatelessWidget {
  const NHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return NVerticalImageText(
            image: NImages.meatIcon,
            title: 'لحوم',
            onTap: () {},
          );
        },
      ),
    );
  }
}
