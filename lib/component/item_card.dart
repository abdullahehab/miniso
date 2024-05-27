import 'package:flutter/material.dart';
import 'package:miniso/views/product_content_page.dart';


class ItemCard extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final String title;
  final String description;
  final String image;
  final String price;
  final int Saleprice;

   ItemCard({
    super.key,
    this.padding = const EdgeInsets.only(right: 16),
    required this.title,
    required this.description,
    required this.image,
    required this.price,
     required this.Saleprice,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  ProductContent(
              title: widget.title,
              description: widget.description,
              image: widget.image,
              price: widget.price, Saleprice:widget.Saleprice,
            ),
          ),
        );
      },
      child: Container(
        margin: widget.padding,
        width: 155,
        height: 254,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white// Use a default color if AppColors is not available
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 158,
              width: double.infinity,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.price} L.E',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          // Do something when the favorite icon is tapped
                          setState(() {
                            // Update the isSelected state
                            isSelected = true; // Call the onTap callback
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          color: isSelected ? Colors.red : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
