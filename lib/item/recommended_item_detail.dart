import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydelivery/controllers/cart_controller.dart';
import 'package:mydelivery/controllers/popular_product_controller.dart';
import 'package:mydelivery/controllers/recommended_porduct_controller.dart';
import 'package:mydelivery/pages/cart/cart_page.dart';
import 'package:mydelivery/routes/route_helper.dart';
import 'package:mydelivery/utils/app_constants.dart';
import 'package:mydelivery/utils/colors.dart';
import 'package:mydelivery/utils/dimension.dart';
import 'package:mydelivery/widgets/app_icon.dart';
import 'package:mydelivery/widgets/big_text.dart';
import 'package:mydelivery/widgets/extendable_text.dart';

class RecommendedItemDetail extends StatelessWidget {
  final int pageId;
  const RecommendedItemDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    // get product using it index from the product controller

    var recommend = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(recommend, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon:Icons.clear),
                ),
                GetBuilder<PopularProductController>(builder: (controller){
        return Stack(
          children: [
            GestureDetector(
                onTap: (){
                  Get.to(()=>CartPage());
                },
                child: AppIcon(icon: Icons.shopping_cart_outlined)),
            Get.find<PopularProductController>().totalItems>=1?
            Positioned(
              right:0,
              top:0,
              child: AppIcon(
                icon: Icons.circle,
                size: 20,
                iconColor: Colors.transparent,
                backgroundColor: AppColors.mainColor,),
            ):
            Container(),
            Get.find<PopularProductController>().totalItems>=1?
            Positioned(
              right:3,
              top:3,
              child: BigText(
                text: Get.find<PopularProductController>().totalItems.toString(),
                size: 12,color: Colors.white,) ,
            ):
            Container()
          ],
        );
      }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20))
                  ),
                  child: Center(child: BigText(text: recommend.name!, size: Dimensions.font26,))),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.baseUrl+AppConstants.uploadUrl+recommend.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExtendbleText(text:(recommend.description!)),
                ),
                SizedBox(height: Dimensions.height20,),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20*2.5,
                  right: Dimensions.width20*2.5,
                  top: Dimensions.height10*2.5,
                  bottom: Dimensions.height10*2.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                      text: "\$${recommend.price!} X ${controller.inCartItems}",
                      color: AppColors.mainBlackColor,
                      size: Dimensions.font26,
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Dimensions.bottomHeightBar,
                padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    bottom: Dimensions.height30,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20 * 2),
                        topRight: Radius.circular(Dimensions.radius20 * 2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.addItem(recommend);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(Dimensions.radius20)),
                        child: BigText(
                          text: "\$ ${recommend.price!} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
      },),
    );
  }
}
