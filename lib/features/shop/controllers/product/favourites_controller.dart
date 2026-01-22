import 'dart:convert';

import 'package:get/get.dart';
import 'package:ninja_store/data/product/product_repository.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/local_storage/storage_utility.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();
  ///variables
  final favorites = <String, bool>{}.obs;
  @override
  void onInit(){
    super.onInit();
    initFavorites();

  }
  //Method to initialize favorites by reading from storage
   Future<void> initFavorites() async {
    final json = TLocalStorage.instance().readData('favorites');
    
      print("Local Storage JSON: $json");  // <-- هنا

    if(json != null){
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key,value as bool)));
    }
  }
  bool isFavourite(String productId){
    return favorites[productId] ?? false;
  }
  void toggleFavoriteProducts(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId]= true;
      saveFavoritesToStorage();
      NLoaders.customToast(message: 'تم إضافة المنتج للمفضلة');
         print("Added $productId to favorites");
    }else{
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      NLoaders.customToast(message :'تم إزالة المنتج من المفضلة');
       print("Added $productId to favorites");
    }
  }
  void saveFavoritesToStorage(){
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites',encodedFavorites);
    print("Favorites saved: $encodedFavorites"); 
  }
  Future<List<ProductModel>> favoriteProducts()async{
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}