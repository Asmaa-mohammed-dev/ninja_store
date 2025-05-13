import 'package:get/get.dart';
import 'package:ninja_store/features/authentication/screens/login/login.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ninja_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/signup.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/verify_email.dart';
import 'package:ninja_store/features/personalization/screens/address/address.dart';
import 'package:ninja_store/features/personalization/screens/cart/cart.dart';
import 'package:ninja_store/features/personalization/screens/checkouts/checkout.dart';
import 'package:ninja_store/features/personalization/screens/profile/widgets/profile.dart';
import 'package:ninja_store/features/personalization/screens/settings/settings.dart';
import 'package:ninja_store/features/shop/product_reviews/product_review.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/home.dart';
import 'package:ninja_store/features/shop/screens/order/order.dart';
import 'package:ninja_store/features/shop/screens/store.dart';
import 'package:ninja_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:ninja_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: NRoutes.home, page: () => const HomeScreen()),
    GetPage(name: NRoutes.store, page: () => const StoreScreen()),
    GetPage(name: NRoutes.favourites, page: () => const FavoritScreen()),
    GetPage(name: NRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
      name: NRoutes.productReviews,
      page: () => const ProductReviewScreen(),
    ),
    GetPage(name: NRoutes.order, page: () => const OrderScreen()),
    GetPage(name: NRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: NRoutes.cart, page: () => const CartScreen()),
    GetPage(name: NRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: NRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: NRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: NRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: NRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: NRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: NRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
