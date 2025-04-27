import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ninja_store/features/shop/product_details/widgets/n_product_attribute.dart';

import 'package:ninja_store/features/shop/product_details/widgets/product_detail_image_slider.dart';
import 'package:ninja_store/features/shop/product_details/widgets/product_meta_data.dart';
import 'package:ninja_store/features/shop/product_details/widgets/rating_share_widget.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: NBottomAddToCart(),
        body: SingleChildScrollView(
          child: Column(
            //Product Image Slider
            children: [
              NProductImageSlider(),

              //Product Detail
              Padding(
                padding: EdgeInsets.only(
                  left: NSizes.defaultSpace,
                  right: NSizes.defaultSpace,
                  bottom: NSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    //Rating & Share
                    NRatingAndShare(),
                    //Price, Title, Stack & Brand
                    NProductMetaData(),
                    //Attribute
                    NProductAttribute(),
                    //Checkout  Button
                    const SizedBox(height: NSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('انهاء الطلب'),
                      ),
                    ),
                    const SizedBox(height: NSizes.spaceBtwSections),
                    //Description
                    const NsectionHeading(
                      title: 'التفاصيل',
                      showActionButton: false,
                    ),
                    const SizedBox(height: NSizes.spaceBtwItems),
                    const ReadMoreText(
                      'هذا منتج قشطة فاخرة من الصافي تُعرف بجمال القوام ولذتها ، هنالك الكثير لتضيفه في سلة التسوق اكتشف أكثر هذا منتج خراي لتضعه في سلة تسوقك سيفدك ويسعد الأطفال ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MAJALLA',
                        fontSize: 13,
                      ),
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'أقرأ أكثر',
                      trimExpandedText: 'أقرأ أقل',
                      moreStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    //Reviews
                    const Divider(),
                    const SizedBox(height: NSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const NsectionHeading(
                          title: 'المراجعات (199)',
                          showActionButton: false,
                        ),
                        Transform.rotate(
                          angle:
                              180 *
                              3.1415926535 /
                              180, // 180 درجة (لازم نحولها لراديان)
                          child: IconButton(
                            icon: const Icon(Iconsax.arrow_right_3),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: NSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
