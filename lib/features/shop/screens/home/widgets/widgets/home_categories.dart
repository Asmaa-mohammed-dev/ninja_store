import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ninja_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:ninja_store/features/shop/controllers/category_controllers.dart';
import 'package:ninja_store/features/shop/screens/sub_category/sub_categories.dart';

class NHomeCategories extends StatelessWidget {
  const NHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return NCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'لا يوجد بيانات',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return NVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
