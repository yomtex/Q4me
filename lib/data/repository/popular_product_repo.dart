import 'package:get/get.dart';
import 'package:mydelivery/data/api/api_client.dart';
import 'package:mydelivery/utils/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({ required this.apiClient});

  Future<Response> getPopularProductList()async{
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}