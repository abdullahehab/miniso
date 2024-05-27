import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/helpers/theme.dart';
import '../../helpers/assets.dart';
import '../checkoutScreens/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(AppAssets.logo),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Your cart',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: context.height * 0.5, // Dynamic height
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.greyBackground),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => const ItemToCart(),
              separatorBuilder: (context, index) => Container(
                height: 2,
                color: AppColors.greyBackground,
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              itemCount: 4,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.greyBackground),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                OrderWidget(title: 'Subtotal', price: 260),
                const SizedBox(height: 10),
                OrderWidget(title: 'Discount(-20%)', price: 260, isDiscounted: true),
                const SizedBox(height: 10),
                OrderWidget(title: 'Delivery Fee', price: 20),
                const SizedBox(height: 20),
                Container(height: 2, color: AppColors.greyBackground),
                const SizedBox(height: 10),
                OrderWidget(title: 'Total', price: 300),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Add promo code',
                            prefixIcon: const Icon(Icons.discount_outlined),
                            filled: true,
                            fillColor: AppColors.greyBackground,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(62)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    DefaultButton(
                      title: 'Apply',
                      onPressed: () {},
                      buttonWidth: 88,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DefaultButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutPage(),
                      ),
                    );
                  },
                  title: 'Go to checkout',
                  icon: const Icon(Icons.arrow_forward_outlined),
                ),
              ],
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  final int price;
  final String title;
  final bool isDiscounted;

  const OrderWidget({
    super.key,
    required this.price,
    required this.title,
    this.isDiscounted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Text(
          '\$$price',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: isDiscounted ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}

class ItemToCart extends StatefulWidget {
  const ItemToCart({super.key});

  @override
  State<ItemToCart> createState() => _ItemToCartState();
}

class _ItemToCartState extends State<ItemToCart> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 110,
      child: Row(
        children: [
          Container(
            width: 99,
            height: 99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.greyBackground,
            ),
            child: Center(
              child: Image.asset('assets/images/bag.png'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        'Gradient Graphic T-shirt',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Size: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Large',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      '\$260',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: 105,
                      height: 31,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62),
                        color: AppColors.greyBackground,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (counter > 1) {
                                  counter--;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove_rounded,
                              size: 20,
                            ),
                          ),
                          Text(
                            '$counter',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                counter++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
