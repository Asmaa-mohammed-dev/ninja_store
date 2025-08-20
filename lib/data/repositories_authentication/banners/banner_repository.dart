import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/n_firebase_auth_exception.dart';
import 'package:ninja_store/features/shop/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;

  //Get all order related to current uder
  Future<List<BannerModel>> fetchBanners() async {
    try {
      //
      final result =
          await _db
              .collection('Banners')
              .where('Active', isEqualTo: true)
              .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw NFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const NFormatException();
    } on PlatformException catch (e) {
      throw NPlatformException(e.code).message;
    }
  }

  //Upload Banners to the cloud firebase
}
