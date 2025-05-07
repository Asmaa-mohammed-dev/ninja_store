import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/n_firebase_auth_exception.dart';
import 'package:flutter/services.dart';
import 'package:ninja_store/data/repositories_authentication/user/user.model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw NFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const NFormatException();
    } on PlatformException catch (e) {
      throw NPlatformException(e.code).message;
    } catch (e) {
      throw 'حدث خطأ، حاول مرة أخرى';
    }
  }
}
