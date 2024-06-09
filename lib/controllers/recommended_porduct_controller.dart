import 'package:get/get.dart';
import 'package:mydelivery/data/repository/popular_product_repo.dart';
import 'package:mydelivery/data/repository/recommended_product_repo.dart';
import 'package:mydelivery/models/product_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = []; // not using this because of it's underscore marks it as a private variable
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); //more like setState
    }else{
      print("could not get products recommended");
    }
  }
}