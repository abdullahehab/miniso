import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/component/navigate.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:miniso/views/main_page.dart';
import 'package:miniso/controllers/providers/navigation_provider.dart';

class DoneCheckoutPage extends ConsumerStatefulWidget {
  const DoneCheckoutPage({super.key});

  @override
  ConsumerState<DoneCheckoutPage> createState() => _DoneCheckoutPageState();
}

class _DoneCheckoutPageState extends ConsumerState<DoneCheckoutPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.stop();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 1,
              child: Container(
                height: MediaQuery.of(context).size.height * .7, // Use MediaQuery for context height
                width: MediaQuery.of(context).size.width, // Use MediaQuery for context width
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(180)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animation/Done.json',
                      height: 300,
                      width: 300,
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller.duration = composition.duration;
                        _controller.forward();
                      },
                      repeat: false, // Ensure the animation doesn't repeat
                    ),
                    const Text(
                      'Payment Successful',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.0),
                      child: Text(
                        'Your order will be delivered to you in next 2-3 working days',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    DefaultButton(
                      title: 'Continue Shopping',
                      buttonWidth: 250,
                      onPressed: () {
                        // Reset the navigation index before navigating to MainPage
                        ref.read(navigationProvider.notifier).resetIndex();
                        navigateAndFinish(context, const MainPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
