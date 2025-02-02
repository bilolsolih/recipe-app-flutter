import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.vm,
  });

  final OnboardingViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: vm,
        builder: (context, child) => PageView.builder(
          controller: vm.controller,
          // demak, yaramas copy-pasterlar, shu joyiga e'tibor berila, +1 bekorga qo'yilmagan
          itemCount: vm.onboardings.length + 1,
          itemBuilder: (context, index) {
            if (index >= vm.onboardings.length) return Center(child: CircularProgressIndicator());
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  vm.onboardings[index].image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                BottomShadow(),
                Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: RecipeElevatedButton(
                    text: "Continue",
                    callback: () => vm.controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
                  ),
                ),
              ],
            );
          },
          onPageChanged: (index) => vm.pageChangedCallBack(index, context),
        ),
      ),
    );
  }
}
