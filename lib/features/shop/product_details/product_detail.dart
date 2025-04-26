import 'package:flutter/material.dart';

import 'package:ninja_store/features/shop/product_details/widgets/product_detail_image_slider.dart';
import 'package:ninja_store/features/shop/product_details/widgets/product_meta_data.dart';
import 'package:ninja_store/features/shop/product_details/widgets/rating_share_widget.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                  ],

                  //Attribute
                  //Checkout  Button
                  //Description
                  //Reviews
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
