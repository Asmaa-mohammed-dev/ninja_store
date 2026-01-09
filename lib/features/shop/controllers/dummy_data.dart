import 'package:ninja_store/features/shop/models/banner_model.dart';
import 'package:ninja_store/features/shop/models/brand_model.dart';
import 'package:ninja_store/features/shop/models/category_model.dart';
import 'package:ninja_store/features/shop/models/product_attribute_model.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/features/shop/models/product_variation_model.dart';
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
    BannerModel(
      imageUrl: NImages.prombanner3,
      targetScreen: NRoutes.favourites,
      active: true,
    ),
  ];

  //User
  // static final UserModel user = UserModel(
  //   firstName: 'Coding',
  //   lastName: 'with Asmaa',
  //   email: 'ajyalacademy99@gmail.com',
  //   phoneNumber: '+01212883756',
  //   profilePicture: TImages.user,
  //   addresses: [
  //     AddressModel(
  //         id: '1',
  //         name: 'Coding with A',
  //         phoneNumber: '+201212883756',
  //         street: 'Abu-Musa',
  //         city: 'New Cairo',
  //         state: 'Egypt',
  //         postalCode: '832423',
  //         country: 'Egypt'),
  //     AddressModel(
  //         id: '6',
  //         name: 'AnyThing',
  //         phoneNumber: '+201212883756',
  //         street: 'Abu-Musa',
  //         city: 'New Cairo',
  //         state: 'Egypt',
  //         postalCode: '1212121',
  //         country: 'Egypt'),
  //   ],
  // );

  // //Cart
  // static final CartModel user = CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //     CartItemModel(
  //       productId: '002',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //   ],
  // );
  // //Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CWT001',
  //     status: OrderStatus.processing,
  //     item: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2025, 17, 6),
  //     deliveryDate: DateTime(2025, 23, 6),
  //   ),
  //   OrderModel(
  //     id: 'CWT002',
  //     status: OrderStatus.processing,
  //     item: cart.items,
  //     totalAmount: 396,
  //     orderDate: DateTime(2025, 17, 6),
  //     deliveryDate: DateTime(2025, 23, 6),
  //   ),
  // ];

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
    CategoryModel(
      id: '6',
      image: NImages.fruitIcon,
      name: 'فاكهة',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: NImages.fruitIcon,
      name: 'فاكهة',
      isFeatured: true,
    ),
    //subcategories
    CategoryModel(
      id: '5',
      image: NImages.fruitIcon,
      name: 'فاكهة',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '6',
      image: NImages.fruitIcon,
      name: 'فاكهة',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '7',
      image: NImages.fruitIcon,
      name: 'فاكهة',
      parentId: '1',
      isFeatured: false,
    ),
  ];

  //List of all brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      image: NImages.fruitIcon,
      name: 'Fruit',
      productsCount: 265,
      isFeatured: true,
    ),
    BrandModel(
      id: '2',
      image: NImages.fruitIcon,
      name: 'Fruit',
      productsCount: 95,
      isFeatured: true,
    ),
    BrandModel(
      id: '3',
      image: NImages.fruitIcon,
      name: 'Fruit',
      productsCount: 265,
      isFeatured: true,
    ),
    BrandModel(
      id: '4',
      image: NImages.fruitIcon,
      name: 'Fruit',
      productsCount: 265,
      isFeatured: true,
    ),
  ];
  // //List of all Brands Categories
  // static final List<BrandCategoryModel> brandCategory = [
  //   BrandCategoryModel(brandId: '1', categoryId: '1'),
  //   BrandCategoryModel(brandId: '1', categoryId: '8'),
  //   BrandCategoryModel(brandId: '1', categoryId: '9'),
  //   BrandCategoryModel(brandId: '2', categoryId: '1'),
  // ];
  // //list of product categories
  // static final List<ProductCategoryModel> productCategories = [
  //   ProductCategoryModel(productId: '001', categoryId: '1'),
  //   ProductCategoryModel(productId: '001', categoryId: '8'),
  //   ProductCategoryModel(productId: '004', categoryId: '3'),
  // ];

  //List of all products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'يودزيل ستيك أنجوس',
      stock: 15,
      price: 110,
      isFeatured: true,
      thumbnail: 'https://cdn.pixabay.com/photo/2020/05/14/22/31/barbecue-5171549_1280.jpg',
      description: 'هذا وصف عن منتج جوزديل سيتك أنجوس تندريليون 250 جم',
      brand: BrandModel(
        id: '1',
        image: 'assets/icons/categories/24.png',
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        'https://cdn.pixabay.com/photo/2021/12/17/00/01/barbecue-6875418_1280.jpg',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['red', 'black', 'green']),
        ProductAttributeModel(
          name: 'Size',
          values: ['Large', 'Medium', 'Small'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 110,
          image: 'https://picsum.photos/200',
          description: 'هذا وصف عن منتج جوزديل سيتك أنجوس تندريليون 250 جم',
          attributeValues: {'Color': 'red', 'Size': 'Small'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 1,
          price: 134,
          salePrice: 110,
          image: 'https://picsum.photos/200',
          description: 'هذا وصف عن منتج جوزديل سيتك أنجوس تندريليون 250 جم',
          attributeValues: {'Color': 'black', 'Size': 'Medium'},
        ),
      ],
      productType: 'ProductType.variable',
      // productType: ProductType.variable.toString(),
    ),
    ProductModel(
      id: '002',
      title: 'فرشييز بيض كبير',
      stock: 15,
      price: 150,
      isFeatured: true,
      thumbnail: 'https://picsum.photos/200',
      description: 'Kids Jilbab. Iron Gray',
      brand: BrandModel(
        id: '2',
        image: 'assets/icons/categories/24.png',
        name: 'لحمة',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        'https://cdn.pixabay.com/photo/2021/12/17/00/01/barbecue-6875418_1280.jpg',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['red', 'black', 'green']),
        ProductAttributeModel(
          name: 'Size',
          values: ['Large', 'Medium', 'Small'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 150,
          salePrice: 120,
          image: 'https://picsum.photos/200',
          description: 'هذا وصف عن منتج جوزديل سيتك أنجوس تندريليون 250 جم',
          attributeValues: {'Color': 'red', 'Size': 'Small'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 1,
          price: 150,
          salePrice: 120,
          image: 'https://picsum.photos/200',
          description: 'هذا وصف عن منتج جوزديل سيتك أنجوس تندريليون 250 جم',
          attributeValues: {'Color': 'black', 'Size': 'Medium'},
        ),
      ],
      productType: 'ProductType.variable',
      // productType: ProductType.variable.toString(),
    ),
  ];
}
