import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:panacare/home/home_page.dart';
import 'package:pinput/pinput.dart';

class PatientSignUpPage extends StatefulWidget {
  const PatientSignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PatientSignUpPageState();
  }
}

class _PatientSignUpPageState extends State<PatientSignUpPage> {
  FocusNode focusNode = new FocusNode();
  var phoneNumber = "";
  var fullName = "";
  var email = "";
  var verificationCode = "";
  var timeRemaining = 3.0;
  var _progress = 0.0;
  var stage = 1;
  var totalSteps = 4;

  @override
  void initState() {
    super.initState();
    _progress = stage / totalSteps;
  }

  _goToBack(BuildContext context) {
    Navigator.pop(context);
  }

  _goToHomePage(BuildContext context, String pin) {
    setState(() {
      verificationCode = pin;
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  HomePage()));
  }

  Widget _buildFullNameInput() {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text(
                "Enter your full name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Full Name")),
            onSaved: (val) => fullName = val!,
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberInput() {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text(
                "Enter your phone number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            autofocus: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Mobile Number")),
            onSaved: (val) => fullName = val!,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                      "By continuing you confirm that you are authorised to use this phone number and agree to receive an SMS text "))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildEmailInput() {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text(
                "Enter your your email address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Email Address")),
            onSaved: (val) => fullName = val!,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationCodeInput() {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text(
                "Enter your your code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Row(
            children: [
              Flexible(
                  child: Text(
                      "Enter the four digit activation code sent to your email and mobile number"))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Pinput(
            autofocus: true,
            mainAxisAlignment: MainAxisAlignment.start,
            onCompleted: (pin) => _goToHomePage(context, pin),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            children: [Text("Time remaining $timeRemaining")],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: const Text("Resend code?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black)),
              )
            ],
          ),
        )
      ],
    );
  }

  _updateStage() {
    setState(() {
      if (stage < totalSteps) {
        stage++;
      }
      _progress = (stage / totalSteps);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          bottom: false,
          maintainBottomViewPadding: true,
          child: Center(
              child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: IconButton(
                                style: IconButton.styleFrom(
                                    foregroundColor:
                                        const HSLColor.fromAHSL(1.0, 0, 0, 0)
                                            .toColor(),
                                    backgroundColor: const HSLColor.fromAHSL(
                                            1.0, 192.0, 0.82, 0.90)
                                        .toColor()),
                                onPressed: () => _goToBack(context),
                                icon: const FaIcon(FontAwesomeIcons.xmark),
                              ))
                        ],
                      ),
                      LinearProgressIndicator(
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.blue),
                          value: _progress),
                      Form(
                          child: [
                        _buildFullNameInput(),
                        _buildPhoneNumberInput(),
                        _buildEmailInput(),
                        _buildVerificationCodeInput()
                      ][stage - 1])
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
        bottomSheet: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              height: 48,
              child: TextButton(
                  onPressed: () => _updateStage(),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero))),
                  child: const Text("Next")),
            ))
          ],
        ));
  }
}
