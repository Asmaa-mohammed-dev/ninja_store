import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProfileMenu extends StatelessWidget {
  const NProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: NSizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.1416), // 180 درجة على محور Y
                child: Icon(icon, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
