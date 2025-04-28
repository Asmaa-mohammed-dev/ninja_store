import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ninja_store/features/shop/product_reviews/widgets/n_overall_product_rating.dart';
import 'package:ninja_store/features/shop/product_reviews/widgets/user_review_card.dart';
import 'package:ninja_store/utils/constants/colors.dart';

import 'package:ninja_store/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //Appbar
        appBar: NAppBar(title: Text('مراجعات وتقييمات'), showBackArrow: true),
        //Body
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المراجعات والتقييمات تم التأكد منها وهى من أشخاص موثوقين',
                ),
                SizedBox(height: NSizes.spaceBtwItems),
                //Overall Product Rating
                NOverallProductRating(),
                NRatingBarIndicator(rating: 3.5),
                Text('12.100', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: NSizes.spaceBtwSections),

                //User Review List
                UserReviewCard(),
                UserReviewCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
