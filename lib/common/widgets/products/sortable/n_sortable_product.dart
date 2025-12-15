import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NSortableProducts extends StatelessWidget {
  const NSortableProducts({super.key, required this.products});
final List<ProductModel> products;


  @override
  Widget build(BuildContext context) {
    //Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        //Dropdown
        Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            initialValue: controller.selectedSortOption.value,
            isExpanded: true, // لتوسيع الـ dropdown بالعربي
            alignment: Alignment.centerRight,
            onChanged: (value) {
              //Sort products based on the selected option
              controller.sortProducts(value!);
            },
            items:
                ['الاسم', 'أعلى سعر', 'أقل سعر', 'تخفيضات', 'الأجدد', 'الشعبية']
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(option),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
        const SizedBox(height: NSizes.spaceBtwSections),

        //Products
        Obx(
          ()=>NGridLayout(
            itemCount: controller.products.length,
            itemBuilder:
                (_, index) => NProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
