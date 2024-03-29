import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipos_app/controllers/onboarding_controller.dart';
import 'package:kipos_app/views/enter_page.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.onboardPageController,
              onPageChanged: _controller.selectedOnboardPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _controller.onboardingPages[index].onboardImage,
                        height: MediaQuery.of(context).size.height * .5,
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Center(
                        child: Text(
                          _controller.onboardingPages[index].onboardTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          _controller.onboardingPages[index].onboardDesc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: _controller
                                            .selectedOnboardPageIndex.value ==
                                        index
                                    ? Colors.red
                                    : Colors.grey,
                                shape: BoxShape.circle),
                          );
                        })),
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: AnimatedButton(
                  // elevation: 0,
                  child: Obx(
                    () {
                      return Text(
                          _controller.isLastOnboardPage ? 'Başla' : 'Atla');
                    },
                  ),
                  // backgroundColor: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnterPage()),
                    );
                    // Navigator.pushNamed(context, '/enter');
                  },
                  duration: 70, // Animaton duration, default is 70 Milliseconds
                  height: 80, // Button Height, default is 64
                  width: 80, // Button width, default is 200
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
