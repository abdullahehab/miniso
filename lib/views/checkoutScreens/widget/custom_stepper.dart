import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../helpers/theme.dart';

class CustomStepper extends StatelessWidget {
  final bool isPayment;
  const CustomStepper({
    super.key,
    this.isPayment=false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 150,
          height: 4,
          color: isPayment?AppColors.primary:AppColors.greyBackground,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPayment?AppColors.primary:AppColors.greyBackground,
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
