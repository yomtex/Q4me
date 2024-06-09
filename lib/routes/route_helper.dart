import 'package:get/get.dart';
import 'package:mydelivery/item/porpula_item_detail.dart';
import 'package:mydelivery/item/recommended_item_detail.dart';
import 'package:mydelivery/pages/home/main_home_page.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularItem = "/popular-item";
  static const String recommendedItem = "/recommended-item";

  static String getInitial()=>'$initial';
  static String getPopularItem(int pageId)=>'$popularItem?pageId=$pageId';
  static String getRecommendedItem(int pageId)=>'$recommendedItem?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>MainHomePage()),

    GetPage(name: popularItem, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularItemDetail(pageId: int.parse(pageId!),);
    },
        transition: Transition.fadeIn
    ),
    GetPage(name: recommendedItem, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedItemDetail(pageId: int.parse(pageId!),);
    },
        transition: Transition.fadeIn
    ),
  ];
}