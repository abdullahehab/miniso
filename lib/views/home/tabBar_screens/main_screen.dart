import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/product_data.dart';
import '../../../helpers/assets.dart';
import '../../../helpers/theme.dart';
import '../../new_arrivals/new_arrivals_page.dart';
import '../widget/banner.dart';
import '../widget/product_listView.dart';
class MainWidget extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {

      return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'New Arrivals',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  NewArrivals(),
                          ));
                    },
                    child: const Text('View All'),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ProductList(),
              const SizedBox(
                height: 20,
              ),
              const BannerWidget(
                image: AppAssets.banner1,
                title: '''
        We Have The
        Best Collection
        Of Perfume''',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Top Selling',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ProductList(),
              const SizedBox(
                height: 20,
              ),
              const BannerWidget(
                image: AppAssets.banner2,
                title: ''' We Have The
      Best Health &
           Beauty Collection''',
              ),
              const SizedBox(
                height: 80,
              )
            ],
          )
        ],
      );

  }
}
