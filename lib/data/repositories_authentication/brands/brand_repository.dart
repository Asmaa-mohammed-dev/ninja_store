import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/n_firebase_auth_exception.dart';
import 'package:ninja_store/features/shop/models/brand_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  //Variables
  final _db = FirebaseFirestore.instance;
  //Get All categories
  Future<List<BrandModel>> getAllBrands()async{
    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
return result;
    }on FirebaseException catch (e) {
      throw NFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const NFormatException();
    } on PlatformException catch (e) {
      throw NPlatformException(e.code).message;
    }

    
  }

  //Get Brands for category
   Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{
    //Query to get all documents where categoryId matches the provided categoryId
QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId',isEqualTo: categoryId).get();
//Extract brandIds from the documents
List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

//Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
final brandQuery = await _db.collection('Brands').where(FieldPath.documentId,whereIn: brandIds).get();
//Extract brand name or other relevant data from the documents
List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
return brands;
    }on FirebaseException catch (e) {
      throw NFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const NFormatException();
    } on PlatformException catch (e) {
      throw NPlatformException(e.code).message;
    }catch (e) {
      throw 'حدث خطأ، حاول مرة أخرى';
    }

    
  }
}