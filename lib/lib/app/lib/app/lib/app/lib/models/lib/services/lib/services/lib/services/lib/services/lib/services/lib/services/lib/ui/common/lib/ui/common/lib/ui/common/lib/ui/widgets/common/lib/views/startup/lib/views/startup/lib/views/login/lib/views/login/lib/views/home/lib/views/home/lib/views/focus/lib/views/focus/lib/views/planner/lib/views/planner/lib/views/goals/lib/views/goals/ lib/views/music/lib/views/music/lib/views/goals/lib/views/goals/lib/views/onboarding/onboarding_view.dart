import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_viewmodel.dart';
import '../../ui/common/app_strings.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) => Scaffold(
        body: PageView(
          controller: model.pageController,
          onPageChanged: model.onPageChanged,
          children: [
            _buildPage(
              title: AppStrings.onboardingTitle1,
              color: Colors.greenAccent,
              image: Icons.block, // replace with actual image widget
            ),
            _buildPage(
              title: AppStrings.onboardingTitle2,
              color: Colors.blueAccent,
              image: Icons.track_changes,
            ),
            _buildPage(
              title: AppStrings.onboardingTitle3,
              color: Colors.purpleAccent,
              image: Icons.smart_toy,
            ),
          ],
        ),
        bottomSheet: model.currentPage == 2
            ? ElevatedButton(
                onPressed: model.completeOnboarding,
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 60)),
              )
            : TextButton(
                onPressed: model.nextPage,
                child: Text('Next'),
              ),
      ),
    );
  }

  Widget _buildPage({required String title, required Color color, required IconData image}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(image, size: 120, color: Colors.white),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
