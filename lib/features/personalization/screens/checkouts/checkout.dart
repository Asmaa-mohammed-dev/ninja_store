import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/products/cart/widgets/n_coupon_code.dart';
import 'package:ninja_store/features/authentication/screens/login/widgets/success_screen/sucess_screen.dart';
import 'package:ninja_store/features/personalization/screens/cart/cart_widgets/cart_item.dart';
import 'package:ninja_store/features/personalization/screens/checkouts/widgets/billing_address_section.dart';
import 'package:ninja_store/features/personalization/screens/checkouts/widgets/billing_amount_section.dart';
import 'package:ninja_store/features/personalization/screens/checkouts/widgets/billing_payment_section.dart';
import 'package:ninja_store/navigation_menu.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(
          showBackArrow: true,
          title: Text(
            'مراجعة الطلب',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 21,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                //Items in Cart
                const NCartItems(showAddRemoveButtons: false),
                SizedBox(height: NSizes.spaceBtwSections),
                //Coupon TextField
                NCouponCode(),
                const SizedBox(height: NSizes.spaceBtwSections),

                //Billing Section
                NRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(NSizes.md),
                  backgroundColor: NColors.white,
                  child: Column(
                    children: [
                      //Pricing
                      NBillingAmountSection(),
                      const SizedBox(height: NSizes.spaceBtwItems),
                      //Divider
                      const Divider(),
                      const SizedBox(height: NSizes.spaceBtwItems),

                      //Payment Methods
                      // const SizedBox(height: NSizes.spaceBtwItems),
                      const NBillingpaymentSection(),
                      //Address
                      NBillingAddressSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          child: ElevatedButton(
            onPressed:
                () => Get.to(
                  () => SucessScreen(
                    image: NImages.staticSuccessIllustration,
                    title: 'تمت عملية الدفع',
                    subTitle: 'منتجك سيتم شحنه لحضرتك قريبًا',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: Text('إنهاء الطلب \$256.0'),
          ),
        ),
      ),
    );
  }
}
