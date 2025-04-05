import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/brands/brand_show_case.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/cart_menu_icon/cart_menu_icon.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/search_container.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/screens/home/store/widgets/category_tab.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/enums.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: NAppBar(
          title: Text(
            'التسوق',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 21,
            ),
          ),
          actions: [
            NCartCountericon(onPressed: () {}, iconColor: NColors.black),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBosIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: NColors.white,
                expandedHeight: 380,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(NSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //Search bar
                      SizedBox(height: NSizes.spaceBtwItems),
                      NSearchContainer(
                        text: 'أبحث عن ...',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: NSizes.spaceBtwSections),
                      //Featured Brands
                      NsectionHeading(
                        title: 'العلامات الرائجة',
                        onPressed: () {},
                      ),
                      SizedBox(height: NSizes.spaceBtwSections / 1.5),
                      NGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const NBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),
                //Tabs
                bottom: NTabBar(
                  tabs: [
                    Tab(child: Text('المخبوزات')),
                    Tab(child: Text('الألبان')),
                    Tab(child: Text('أرز ومعكرونة')),
                    Tab(child: Text('مخللات')),
                    Tab(child: Text('صلصة')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              NCategoryTab(),
              NCategoryTab(),
              NCategoryTab(),
              NCategoryTab(),
              NCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
