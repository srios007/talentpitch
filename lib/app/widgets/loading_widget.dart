import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:talentpitch/app/utils/palette.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Palette.green,
          rightDotColor: Palette.mainColor,
          size: 20,
        ),
      ),
    );
  }
}
