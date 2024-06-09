import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydelivery/data/repository/cart_repo.dart';
import 'package:mydelivery/models/cart_model.dart';
import 'package:mydelivery/models/product_model.dart';
import 'package:mydelivery/utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items =>_items;

  void addItem(ProductModel productModel, int quantity){
    var totalQuantity=0;
  //   check for duplicate
    if(_items.containsKey(productModel.id!)){
      _items.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity ;
        return
          CartModel(
            id:value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity:value.quantity! + quantity,
            isExist:true,
            time:DateTime.now().toString()
        );
      });
      if(totalQuantity <= 0){
        _items.remove(productModel.id);
      }
    }else{
      if(quantity > 0){
        _items.putIfAbsent(productModel.id!, () {
          return CartModel(
              id:productModel.id,
              name: productModel.name,
              price: productModel.price,
              img: productModel.img,
              quantity:quantity,
              isExist:true,
              time:DateTime.now().toString()
          );
        }
        );
      }else{
        Get.snackbar(
          "Message", "You should at least add an item in the cart!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
            // icon: Icon(Icons.warning),
        );
      }
    }
  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  //   creating funtion thst returns CartModel
  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}