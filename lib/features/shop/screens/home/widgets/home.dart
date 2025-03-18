import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/primary_header_container.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/search_container.dart';
import 'package:ninja_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/home_appbar.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/home_categories.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            NPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  NHomeAppBar(),
                  SizedBox(height: NSizes.spaceBtwSections),
                  //searchbar
                  NSearchContainer(text: 'أبحث عن ............'),
                  //heading
                  SizedBox(height: NSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(right: NSizes.defaultSpace),
                    child: Column(
                      children: [
                        NsectionHeading(
                          title: 'التصنيفات',
                          showActionButton: false,
                        ),
                        SizedBox(height: NSizes.spaceBtwSections),
                        //categories
                        NHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
