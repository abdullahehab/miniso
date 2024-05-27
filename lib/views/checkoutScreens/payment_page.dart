import 'package:flutter/material.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/component/navigate.dart';
import 'package:miniso/helpers/constants.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:miniso/views/checkoutScreens/credit_page.dart';
import 'package:miniso/views/checkoutScreens/widget/custom_stepper.dart';

import 'done_checkout.dart';

enum PaymentMethod { cash, visa }

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethod? Payment = PaymentMethod.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomStepper(
              isPayment: true,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: BorderRadius.circular(
                  62,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.monetization_on_outlined,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Cash',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Radio<PaymentMethod>(
                    activeColor: AppColors.primary,
                    value: PaymentMethod.cash,
                    groupValue: Payment,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        Payment = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: BorderRadius.circular(
                  62,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.wallet,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Visa',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Radio<PaymentMethod>(
                    activeColor: AppColors.primary,
                    value: PaymentMethod.visa,
                    groupValue: Payment,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        Payment = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            DefaultButton(
              title: 'Pay \$467',
              onPressed: () {
                if(Payment ==PaymentMethod.visa){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreditPage(),),);

                }else if(Payment ==PaymentMethod.cash){
                  navigateAndFinish(context, DoneCheckoutPage(),);
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
