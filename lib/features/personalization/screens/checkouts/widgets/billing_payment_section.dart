import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBillingpaymentSection extends StatelessWidget {
  const NBillingpaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NsectionHeading(
          title: 'طرق الدفع',
          buttonTitle: 'تغيير',
          onPressed: () {},
        ),
        const SizedBox(height: NSizes.spaceBtwItems / 2),
        Row(
          children: [
            NRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: NColors.white,
              padding: const EdgeInsets.all(NSizes.sm),
              child: const Image(
                image: AssetImage(NImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: NSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ],
    );
  }
}
