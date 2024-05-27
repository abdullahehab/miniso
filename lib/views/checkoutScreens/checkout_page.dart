import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/helpers/constants.dart';
import 'package:miniso/views/checkoutScreens/payment_page.dart';
import 'package:miniso/views/checkoutScreens/widget/custom_stepper.dart';
import 'package:miniso/views/checkoutScreens/widget/loctaion_bottomSheet.dart';






class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomStepper(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Complete Your Information:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          // labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Second Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          // labelText: ' second name',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              showDropdownIcon: false,
              initialCountryCode: 'EG',
              // controller: phoneNumberController,
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'How would you like to enter your address?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              title: 'Enter Your Address Manually',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) =>
                  const LocationBottomSheet(),
                );
              },
              buttonWidth: context.width,
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              title: 'Find Your Location On Map',
              onPressed: () {
              },
              buttonWidth: context.width,
              borderedButton: true,
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      title: 'Back',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      borderedButton: true,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: DefaultButton(
                      title: 'Next',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentPage(),
                          ),
                        );
                      },
                    ),
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
