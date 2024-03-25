import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PatientSignUpPage extends StatefulWidget {
  const PatientSignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PatientSignUpPageState();
  }
}

class _PatientSignUpPageState extends State<PatientSignUpPage> {
  var phoneNumber = "";
  var fullName = "";
  var email = "";
  var _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _progress = 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blue),
                      value: _progress),
                  Row(
                    children: [
                      Text("Enter your full name"),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      )),
    ),
    bottomNavigationBar: BottomAppBar(

        child:
    Row(
    children: [
    Expanded(
    child: TextButton(
        onPressed: () => {},
    style: TextButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.zero))),
    child: Text("Next")))
    ],
    ) ),
    );
  }
}
