import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kipos_app/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedOnboardPageIndex = 0.obs;
  var onboardPageController = PageController();

  bool get isLastOnboardPage =>
      selectedOnboardPageIndex.value == onboardingPages.length - 1;

  forvardAction() {
    if (!isLastOnboardPage)
      onboardPageController.nextPage(
          duration: 300.milliseconds, curve: Curves.easeInOut);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo("assets/images/coffe-beans-min.jpg", 'Kahveye Dair Her şey',
        'Çekirdeklerin eşsiz sırlarına hazır mısınız?'),
    OnboardingInfo("assets/images/equipment-min.jpg", '3. Nesil Ekipmanlar',
        'Harika bir dostunuz olacak'),
    OnboardingInfo("assets/images/brew-min.jpg", 'Demleme Yöntemleri',
        'Birbirinden harika tarifler öğreneceksiniz'),
  ];
}
