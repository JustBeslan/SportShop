import 'package:dio/dio.dart';
import 'package:effective_mobile_flutter_task/post_api.dart';
import 'package:effective_mobile_flutter_task/pages/page1/item_product.dart';
import 'package:async/async.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int discount;

  const Product({
    required this.category,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.discount = 0
  });

  static Product fromJson(Map<String, dynamic> json) => Product(
    category: json['category'] as String,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    imageUrl: json['image_url'] as String,
    discount: json['discount'] as int? ?? 0,
  );

  static Map<String, dynamic> toJson(Product instance) => <String, dynamic>{
    'name': instance.name,
    'price': instance.price,
    'image_url': instance.imageUrl,
    'category': instance.category,
    'discount': instance.discount,
  };
}

abstract class Products {

  static CancelableOperation? _cancelableOperation;

  static Future<List<Product>> getData(TypeItem typeItem) async {

    _cancelableOperation = CancelableOperation.fromFuture(
      _getListProducts(typeItem == TypeItem.latest
          ? "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
          : "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
      ),
    ).then(
          (val) => val,
      onCancel: () => [],
      onError: (obj, stackTrace) => [],
    );

    final value = await _cancelableOperation?.value;

    return value;
  }

  static Future<List<Product>> cancelFuture() async {
    final result = await _cancelableOperation?.cancel();

    return result;
  }

  static Future<List<Product>> _getListProducts(String url) async {
    final client = RestClient(
        Dio(BaseOptions(contentType: "application/json")), baseUrl: url);
    return client.getProducts();
  }
}
