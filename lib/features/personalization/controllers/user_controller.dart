import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/user/user.model.dart';
import 'package:ninja_store/data/repositories_authentication/user/user.repository.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  ///Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        ///Convert Name to first and last name
        final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? '',
        );
        final username = UserModel.generateUsername(
          userCredentials.user!.displayName ?? '',
        );

        ///Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        ///Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      NLoaders.warningSnackBar(
        title: 'لم يتم حفظ البيانات',
        message:
            'حدث خطأ ما أثناء حفظ بياناتك. بإمكانك إعادة حفظ بياناتك في ملفك الشخصي',
      );
    }
  }
}
