import 'package:dio/dio.dart';
import 'package:effective_mobile_flutter_task/product.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST("")
  Future<List<Product>> getProducts();
}
