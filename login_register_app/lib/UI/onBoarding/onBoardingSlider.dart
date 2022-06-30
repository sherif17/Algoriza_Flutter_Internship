import 'dart:io';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app/UI/onBoarding/OnBoardingModel.dart';

class OnBoardingSlider extends StatefulWidget {
  const OnBoardingSlider({Key? key}) : super(key: key);

  @override
  State<OnBoardingSlider> createState() => _OnBoardingSliderState();
}

class _OnBoardingSliderState extends State<OnBoardingSlider> {
  PageController controller = PageController();
  int _totalDots = 3;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position.toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: _updatePosition,
              children: [
                OnBoardingModel([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Text(
                          "Get food delivery to your doorstep asap",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Text(
                          "We have young and professsional delivery team that will bring your food as soon as possible to your doorstep ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // Padding(padding: EdgeInsets.all(12.0)),
                ], "assets/images/sammy-delivery-1.png"),
                OnBoardingModel(
                  [
                    Padding(
                      padding: const EdgeInsets.all(19),
                      child: Column(
                        children: [
                          const Text(
                            "Buy any food from your favorite restaurant ",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            "We have young and professsional delivery team that  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(12.0)),
                  ],
                  "assets/images/sammy-delivery-by-drone.png",
                ),
                OnBoardingModel(
                  [
                    Padding(
                      padding: const EdgeInsets.all(19),
                      child: Column(
                        children: [
                          const Text(
                            "Buy any food from your favorite restaurant ",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            "We have young and professsional delivery team that  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(12.0)),
                  ],
                  "assets/images/sammy-order-completed-by-a-delivery-girl.png",
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _currentPosition,
                  decorator: DotsDecorator(
                      size: Size(25.0, 7),
                      activeSize: Size(25.0, 7),
                      activeShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(5),
                        right: Radius.circular(5),
                      )),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(5),
                        right: Radius.circular(5),
                      )),
                      color: Colors.grey.withOpacity(0.3),
                      activeColor: Colors.orange),
                  onTap: (double page) {
                    setState(() {
                      controller.animateToPage(page.toInt(),
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
