import 'package:get/get.dart';

import '../model/product/product_model.dart';
import '../services/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      var fetchedProducts = await ProductService.fetchProducts();
      products.value = fetchedProducts;
    } finally {
      isLoading.value = false;
    }
  }

}
