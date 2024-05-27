import 'package:flutter/material.dart';

import '../../../helpers/theme.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String title2;
  final VoidCallback? onTab;
  final Widget icon;

  const ProfileWidget({
    super.key, // Corrected super.key to Key? key
    required this.title,
    required this.title2,
    this.onTab,
    required this.icon,
  }); // Corrected super constructor

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTab != null) {
          onTab!(); // Call onTab callback if it's not null
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      title2,
                      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: AppColors.greyBackground,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
