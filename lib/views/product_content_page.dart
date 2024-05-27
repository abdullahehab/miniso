import 'package:flutter/material.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:miniso/views/home/widget/product_listView.dart';

class ProductContent extends StatefulWidget {
  const ProductContent(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
        required this.Saleprice,

      });
  final String title;
  final String description;
  final String image;
  final String price;
  final int Saleprice;
  @override
  State<ProductContent> createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            Container(
              width: double.infinity,
              height: 282,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Center(
                child: Image.network(widget.image),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  '${widget.price} L.E',

                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.grey),
                ),
                const SizedBox(
                  width: 15,
                ),
                 Text(
                  '${widget.Saleprice} L.E',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 62,
                  height: 31,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62),
                      color: Colors.pink[100]),
                  child: const Center(
                    child: Text(
                      '-40%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'This graphic t-shirt which is perfect for any occasion. Crafted from a soft and breathable fabric, it offers superior comfort and style.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              title: 'Bye it now ',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              title: 'Add to cart ',
              onPressed: () {},
              borderedButton: true,
            ),
            const Text(
              'You Might Also Like',
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
          ],
        ),
      ),
    );
  }
}
