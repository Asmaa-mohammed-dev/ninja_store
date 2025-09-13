import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/features/personalization/controllers/user_controller.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';

class NUserProfileTitle extends StatelessWidget {
  const NUserProfileTitle({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: NCircularImage(
        image: NImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 21,
          color: NColors.white,
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 15,
          color: NColors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: NColors.white),
      ),
    );
  }
}
