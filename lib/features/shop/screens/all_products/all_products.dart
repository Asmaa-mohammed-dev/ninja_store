import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(title: Text('المنتجات الرائجة'), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                //Dropdown
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                    isExpanded: true, // لتوسيع الـ dropdown بالعربي
                    alignment: Alignment.centerRight,
                    onChanged: (value) {},
                    items:
                        [
                              'الاسم',
                              'أعلى سعر',
                              'أقل سعر',
                              'تخفيضات',
                              'الأجدد',
                              'الشعبية',
                            ]
                            .map(
                              (option) => DropdownMenuItem(
                                value: option,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(option),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                const SizedBox(height: NSizes.spaceBtwSections),

                //Products
                NGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => NProductCardVertical(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
