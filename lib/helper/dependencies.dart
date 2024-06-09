import 'package:get/get.dart';
import 'package:mydelivery/controllers/cart_controller.dart';
import 'package:mydelivery/controllers/popular_product_controller.dart';
import 'package:mydelivery/controllers/recommended_porduct_controller.dart';
import 'package:mydelivery/data/api/api_client.dart';
import 'package:mydelivery/data/repository/cart_repo.dart';
import 'package:mydelivery/data/repository/popular_product_repo.dart';
import 'package:mydelivery/data/repository/recommended_product_repo.dart';
import 'package:mydelivery/utils/app_constants.dart';

Future<void> init()async{
  // api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.baseUrl));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}