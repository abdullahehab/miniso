import 'package:flutter/material.dart';
import '../../../helpers/theme.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  final String title;
  const BannerWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 114,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.primary,
            AppColors.gradiantColor,
          ],
        ),
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const Spacer(),
          Image.asset(image)
        ],
      ),
    );
  }
}
