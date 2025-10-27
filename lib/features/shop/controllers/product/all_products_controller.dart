import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/product/product_repository.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance => Get.find();
  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  Future<List<ProductModel>> fetchProductsByQuery(Query? query)async{
    try{
      if(query == null) return [];
final products =await repository.fetchProductsByQuery(query);
return products;
    }catch(e){
      NLoaders.errorSnackBar(title: 'حدث خطأ!', message: e.toString());
      return [];
    }
  }
  void sortProducts (String sortOption){
    selectedSortOption.value = sortOption;
    switch (sortOption){
      case 'Name': products.sort((a,b) => a.title.compareTo(b.title));
      break;
      case 'Higher Price': products.sort((a,b) => b.price.compareTo(b.price));
      break;
      case 'أقل سعر': products.sort((a,b) => a.price.compareTo(b.price));
      break;
      case 'الأجدد': products.sort((a,b) => a.date!.compareTo(b.date!));
      break;
      case 'التخفيضات': products.sort((a,b) {
        if (b.salePrice > 0) {
          return b.salePrice.compareTo(a.salePrice);

        }else if(a.salePrice > 0){
          return -1;
        }else {
          return 1;
        }
      
      });
      break;
      default :
      //Default sorting option: name
      products.sort((a, b) =>a.title.compareTo(b.title));
    }
  }
  void assignProducts(List<ProductModel> products){
    //Assign products to the 'products' List
    this.products.assignAll(products);
    sortProducts('الاسم');
  }
}