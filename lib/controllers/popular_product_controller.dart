import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydelivery/controllers/cart_controller.dart';
import 'package:mydelivery/data/repository/popular_product_repo.dart';
import 'package:mydelivery/models/cart_model.dart';
import 'package:mydelivery/models/product_model.dart';
import 'package:mydelivery/utils/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = []; // not using this because of it's underscore marks it as a private variable
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;



  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity =>_quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); //more like setState
    }else{
      print("could mot get popular product");
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity +1);
    }else{
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_inCartItems+quantity) < 0){
      Get.snackbar(
        "Item count", "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        // icon: Icon(Icons.warning),
      );
      if(_inCartItems > 0){
        _quantity = - _inCartItems;
        return _quantity;
      }
      return 0;
    }else if((_inCartItems+quantity) > 20){
      Get.snackbar(
        "Item count", "You can't add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        // icon: Icon(Icons.warning),
      );
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not "+exist.toString());
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    print("Quantity in cart is "+_inCartItems.toString());
  //   if item in
  //   get from storge _inCartItems
  }

  void addItem(ProductModel productModel){
      _cart.addItem(productModel, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(productModel);
      // update();
      _cart.items.forEach((key, value) {
        print("Id = "+value.id.toString()+" Quantity "+value.quantity.toString());
      });
    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}