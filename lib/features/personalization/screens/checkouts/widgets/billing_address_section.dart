import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBillingAddressSection extends StatelessWidget {
  const NBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NsectionHeading(
          title: 'مكان الشحن',
          buttonTitle: 'تغير',
          onPressed: () {},
        ),
        Text(
          'تم برمجته بواسطة نينجا ستور',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: NSizes.spaceBtwItems),
            Text(
              '+012132434324',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(width: NSizes.spaceBtwItems),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: NSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'جدة، المملكة العربية السعودية',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
