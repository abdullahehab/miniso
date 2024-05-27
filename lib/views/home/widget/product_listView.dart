import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../component/item_card.dart';
import '../../../controllers/product_data.dart';

class ProductList extends StatelessWidget {
  ProductList({
    Key? key,
  }) : super(key: key);

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SizedBox(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return ItemCard(
                title: product.title,
                description: product.description,
                image: product.image,
                price: product.price, Saleprice:product.Saleprice,
              );
            },
          ),
        );
      }
    });
  }
}

