import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';

void uploadDummyProductsToFirestore(List<ProductModel> products) {
  final productsCollection = FirebaseFirestore.instance.collection('Products');

  for (final product in products) {
    productsCollection.doc(product.id).set({
      'title': product.title,
      'stock': product.stock,
      'price': product.price,
      'isFeatured': product.isFeatured,
      'thumbnail': product.thumbnail,
      'description': product.description,
      'salePrice': product.salePrice,
      'sku': product.sku,
      'categoryId': product.categoryId,
      'images': product.images,
      'brand': {
        'id': product.brand!.id,
        'image': product.brand!.image,
        'name': product.brand!.name,
        'productsCount': product.brand!.productsCount,
        'isFeatured': product.brand!.isFeatured,
      },
      'productAttributes':
          product.productAttributes
              ?.map((attr) => {'name': attr.name, 'values': attr.values})
              .toList(),
      'productVariations':
          product.productVariations
              ?.map(
                (variation) => {
                  'id': variation.id,
                  'stock': variation.stock,
                  'price': variation.price,
                  'salePrice': variation.salePrice,
                  'image': variation.image,
                  'description': variation.description,
                  'attributeValues': variation.attributeValues,
                },
              )
              .toList(),
      'productType': product.productType,
    });
  }
}
