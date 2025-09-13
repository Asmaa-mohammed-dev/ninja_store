import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(NImages.user)),
                const SizedBox(width: NSizes.spaceBtwItems),
                Text(
                  'أحمد',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MAJALLA',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        //Review
        Row(
          children: [
            NRatingBarIndicator(rating: 5),
            const SizedBox(width: NSizes.spaceBtwItems),
            Text(
              '1 نوفمبر 2025',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: NSizes.spaceBtwItems),
        ReadMoreText(
          ' واجهة المستخدم شكلها خرافي أعجبتني جدًا وأحببتُ الألوان وتجربة المستخدم أعطيها 10 من 10 ونجمة شكرا لكم على هذا الجمال الرهيب وشكرا لكل من ساهم في انشاء التطبيق',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'أقرأ أقل',
          trimCollapsedText: 'أقرأ أكثر',
          moreStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: NColors.primary,
          ),
          lessStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: NColors.primary,
          ),
        ),
        const SizedBox(height: NSizes.spaceBtwItems),

        //Company Review
        NRoundedContainer(
          backgroundColor: NColors.grey,
          child: Padding(
            padding: EdgeInsets.all(NSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' نينجا ستور',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      ' 2 نوفمبر 2023م ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                ReadMoreText(
                  ' واجهة المستخدم شكلها خرافي أعجبتني جدًا وأحببتُ الألوان وتجربة المستخدم أعطيها 10 من 10 ونجمة شكرا لكم على هذا الجمال الرهيب وشكرا لكل من ساهم في انشاء التطبيق',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'أقرأ أقل',
                  trimCollapsedText: 'أقرأ أكثر',
                  moreStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: NColors.primary,
                  ),
                  lessStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: NColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: NSizes.spaceBtwSections),
      ],
    );
  }
}
