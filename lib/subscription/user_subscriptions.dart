import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSubscriptionsPage extends StatefulWidget {
  const UserSubscriptionsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserSubscriptionsPageState();
  }
}

class _UserSubscriptionsPageState extends State<UserSubscriptionsPage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 36.0, right: 36.0, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                        foregroundColor:
                            const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                        backgroundColor:
                            const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90)
                                .toColor()),
                    onPressed: () => {},
                    icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                  ))
            ],
          ),
          const Text("My Subscriptions",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color.fromRGBO(120, 59, 99, 1),
                  fontWeight: FontWeight.w600)),
          Container(
            width: double.infinity,
            height: 118,
            color: const Color.fromRGBO(187, 80, 60, 1),
            child: const Text("Text"),
          ),
          const Text("Other Packages for you",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color.fromRGBO(120, 59, 99, 1),
                  fontWeight: FontWeight.w600))
        ],
      ),
    )));
  }
}
