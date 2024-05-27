import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miniso/helpers/assets.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:miniso/views/home/tabBar_screens/main_screen.dart';
import 'package:miniso/views/search/search_page.dart';
import '../../component/item_card.dart';
import '../../controllers/product_data.dart';

class HomePage extends StatefulWidget {

   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController controller = Get.put(ProductController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          surfaceTintColor: Colors.transparent,
          leading: const Icon(
            Icons.notifications_none,
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                AppAssets.logo,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: AppColors.primary,
            indicatorColor: AppColors.primary,
            isScrollable: false,
            tabs: [
              Text(
                'Main',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'beauty',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'care',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Clothes',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            MainWidget(),
            BeutyWidget(),
            CareWidget(),
            ClothesWidget(),
          ],
        ),
      ),
    );
    });
  }
}

class CareWidget extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
   CareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Care',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              shrinkWrap: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                var product = controller.products[index];
                controller.products.length;
                ItemCard(title: product.title, description:  product.description, image: product.image, price: product.price, Saleprice: product.Saleprice,);
              }
            ),
          ),
        ],
      ),
    );
    });
  }
}

class ClothesWidget extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
   ClothesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Clothes',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                shrinkWrap: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  var product = controller.products[index];
                  controller.products.length;
                  ItemCard(title: product.title, description:  product.description, image: product.image, price: product.price, Saleprice:product.Saleprice,);
                }
            ),
          ),
        ],
      ),
    );
  }
}

class BeutyWidget extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
   BeutyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Care',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                shrinkWrap: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  var product = controller.products[index];
                  controller.products.length;
                  ItemCard(title: product.title, description:  product.description, image: product.image, price: product.price, Saleprice: product.Saleprice,);
                }
            ),
          ),
        ],
      ),
    );
  }
}


