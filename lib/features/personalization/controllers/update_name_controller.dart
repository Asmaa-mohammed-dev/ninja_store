import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/user/user.repository.dart';
import 'package:ninja_store/features/personalization/controllers/user_controller.dart';
import 'package:ninja_store/features/personalization/screens/profile/widgets/profile.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/internet/network_manager.dart';
import 'package:ninja_store/utils/popups/full_screen_loader.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data  when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start lodaing
      NFullScreenLoader.openLoadingDialog(
        'نحن نقوم بتحديث بياناتك',
        NImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        NFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        NFullScreenLoader.stopLoading();
        return;
      }
      // Update user's first $ last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);
      // Update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      //Remove loader
      NFullScreenLoader.stopLoading();
      // Show Success Message
      NLoaders.successSnackBar(title: 'تهانيا', message: 'لقد تم تحديث اسمك');
      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      NFullScreenLoader.stopLoading();
      NLoaders.errorSnackBar(title: 'حدث خطأ !', message: e.toString());
    }
  }
}
