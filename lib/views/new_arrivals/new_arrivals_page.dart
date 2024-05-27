import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miniso/component/item_card.dart';

import '../../controllers/product_data.dart';
import '../../helpers/theme.dart';

class NewArrivals extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  NewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Arrivals',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: 10,
                      shrinkWrap: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        var product = controller.products[index];
                        controller.products.length;
                        ItemCard(
                          title: product.title,
                          description: product.description,
                          image: product.image,
                          price: product.price, Saleprice: product.Saleprice,
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
