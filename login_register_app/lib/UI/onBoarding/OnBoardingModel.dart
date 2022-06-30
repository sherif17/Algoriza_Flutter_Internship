import 'package:flutter/widgets.dart';

class OnBoardingModel extends StatelessWidget {
  final List<Widget> text;
  final String imagePath;

  const OnBoardingModel(this.text, this.imagePath, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.tealAccent.shade100,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(imagePath),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: text),
              )),
        ],
      ),
    );
  }
}
