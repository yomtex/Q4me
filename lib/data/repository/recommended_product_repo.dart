import 'package:get/get.dart';
import 'package:mydelivery/data/api/api_client.dart';
import 'package:mydelivery/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({ required this.apiClient});

  Future<Response> getRecommendedProductList()async{
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }
}