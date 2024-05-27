import 'package:flutter/material.dart';
import 'package:miniso/helpers/assets.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:miniso/views/main_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'cache_helpers.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: AppAssets.boarding1,
      title: 'Find what you need here',
      body: 'We have collected everything you need in one application',
    ),
    BoardingModel(
      image: AppAssets.boarding2,
      title: 'Usability',
      body:
      'For effortless navigation and seamless browsing, our intuitive usability feature ensures that every tap feels like a breeze, making your shopping journey smoother than ever before',
    ),
    BoardingModel(
      image: AppAssets.boarding3,
      title: 'Make it easier',
      body:
      'Find what you love with just a snap or a sound! Explore our \'Search by Image\' and \'Voice Search\' features – turning your visual and vocal cues into the ultimate shopping experience',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
          (route) => false,
    );
  }

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index) {
                    setState(() {
                      isLast = index == boarding.length - 1;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildBoardingItem(
                    boarding[index],
                    constraints.maxHeight,
                    constraints.maxWidth,
                    context,
                  ),
                  itemCount: boarding.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBoardingItem(
      BoardingModel model,
      double height,
      double width,
      BuildContext context,
      ) {
    double titleFontSize = width * 0.08; // Example adjustment
    double bodyFontSize = width * 0.05; // Example adjustment

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              image: AssetImage(model.image),
              // fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(top: height * 0.6),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  model.body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: AppColors.primary,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else {
                          boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
