import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(showBackArrow: true, title: Text('أضف عنوان جديد')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: 'الاسم',
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'رقم الهاتف',
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'الشارع',
                          ),
                        ),
                      ),
                      const SizedBox(width: NSizes.spaceBtwInputFields),

                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'الرقم البريدي',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'المدينة',
                          ),
                        ),
                      ),
                      const SizedBox(width: NSizes.spaceBtwInputFields),

                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'المحافظة',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      labelText: 'الدولة',
                    ),
                  ),
                  const SizedBox(height: NSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {}, child: Text('حفظ')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
