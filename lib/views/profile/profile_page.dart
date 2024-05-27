import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/helpers/constants.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:miniso/views/auth/login_page.dart';
import 'package:miniso/views/profile/wallet_screen.dart';
import 'package:miniso/views/profile/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              radius: 50,
              child: Icon(
                Icons.person_outline_outlined,
                size: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome To MiniSo',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  title: 'SIGN IN',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: DefaultButton(
                  title: 'SIGN IN',
                  borderedButton: true,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: AppColors.greyBackground,
            height: 4,
            width: context.width,
          ),
          ProfileWidget(
            title: 'My Orders',
            icon: const Icon(Icons.shopping_bag_outlined),
            title2: 'Track your Orders',
            onTab: () {},
          ),
          ProfileWidget(
            title: 'My Wallet',
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title2: 'Your Digital Wallet For Easy Transaction',
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WalletPage(),
                ),
              );
            },
          ),
          ProfileWidget(
            title: 'Customer Service',
            icon: const Icon(
              Icons.connect_without_contact,
            ),
            title2: 'Call us, Email,ChatBot,',
            onTab: () {},
          ),
          ProfileWidget(
            title: 'Rate Us',
            icon: const Icon(Icons.star_border_outlined),
            title2: 'Help us to improve our service',
            onTab: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Center(
                      child: Text(
                        'Rate Us!',
                      ),
                    ),
                    content: Row(
                      children: [
                        RatingBar.builder(
                          tapOnlyMode: false,
                          unratedColor: Colors.grey,
                          itemSize: 50,
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          itemBuilder: (context, _) => const Icon(
                            size: 5,
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text("Submit"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text("No Thanks"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ProfileWidget(
            title: 'Logout',
            icon: const Icon(Icons.login),
            title2: 'We Will Miss you ',
            onTab: () {},
          ),
        ],
      ),
    );
  }
}
