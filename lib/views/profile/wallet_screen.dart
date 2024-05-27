import 'package:flutter/material.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/helpers/constants.dart';
import 'package:miniso/helpers/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(
          16,
        ),
        children: [
          Container(
            height: 250,
            width: context.width,
            decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\$ 0,00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultButton(
                    title: 'Redeem Now',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => Container(
                          height: 250,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Redeem Your Card',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Gift Card',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Enter The Gift Card Code',
                                    prefixIcon: Icon(Icons.wallet),
                                    filled: true,
                                    fillColor: AppColors.greyBackground,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          62,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DefaultButton(
                                  title: 'Redeem',
                                  onPressed: () {},
                                  buttonWidth: double.infinity,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    buttonWidth: 100,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Transaction History',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const Divider(
            color: AppColors.primary,
            height: 1,
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text('No Transaction Found'),
          )
        ],
      ),
    );
  }
}
