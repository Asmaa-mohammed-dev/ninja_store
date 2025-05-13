import 'package:ninja_store/features/shop/models/banner_model.dart';
import 'package:ninja_store/features/shop/models/category_model.dart';
import 'package:ninja_store/routes/routes.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';

class NDummyData {
  //Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: NImages.prombanner1,
      targetScreen: NRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: NImages.prombanner2,
      targetScreen: NRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: NImages.prombanner3,
      targetScreen: NRoutes.favourites,
      active: true,
    ),
  ];
  //User
  // static final UserModel user = UserModel();
  //Cart
  //Order
  //List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: NImages.meatIcon,
      name: 'لحوم',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: NImages.chickenIcon,
      name: 'دجاج',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: NImages.fishIcon,
      name: 'أسماك',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: NImages.vegIcon,
      name: 'خضار',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: NImages.fruitIcon,
      name: 'فاكهة',
      isFeatured: true,
    ),
  ];
}
