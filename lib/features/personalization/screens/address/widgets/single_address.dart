import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NSingleAddress extends StatelessWidget {
  const NSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return NRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(NSizes.md),
      backgroundColor:
          selectedAddress
              ? NColors.primary.withValues(alpha: 0.5)
              : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : Colors.grey,
      margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAddress ? NColors.dark.withValues(alpha: 0.6) : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "أحمد",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: NSizes.sm / 2),
              const Text(
                '+21211322',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: NSizes.sm / 2),
              const Text(
                'مدينة نصر أول، القاهرة ، مصر',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
