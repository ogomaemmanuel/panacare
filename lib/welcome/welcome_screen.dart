import 'package:flutter/cupertino.dart';

class WelcomeScreenSlide extends StatelessWidget {
  final String text;
  final String imageLocation;

  const WelcomeScreenSlide(
      {super.key, required this.text, required this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image(image: AssetImage(imageLocation)),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
          ))
        ],
      ),
    );
  }
}
