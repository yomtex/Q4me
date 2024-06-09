import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mydelivery/controllers/popular_product_controller.dart';
import 'package:mydelivery/controllers/recommended_porduct_controller.dart';
import 'package:mydelivery/item/porpula_item_detail.dart';
import 'package:mydelivery/item/recommended_item_detail.dart';
import 'package:mydelivery/pages/home/main_home_page.dart';
import 'package:mydelivery/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  // to make sure it initialzed
  WidgetsFlutterBinding.ensureInitialized();
  // load dependencies before the main class
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
