import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panacare/registration/patient_sign_up_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  _goToHome(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left:36.0, right: 36.0,top:16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: IconButton(
                        style: IconButton.styleFrom(
                            foregroundColor:  const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                            backgroundColor: const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90).toColor()),
                          onPressed: () => _goToHome(context),
                          icon: const FaIcon(FontAwesomeIcons.xmark),
                    ))
                  ],
                ),
                const Row(
                  children: [
                    Flexible(
                        child: Text(
                      "What kind of profile would you like to create today ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(120, 59, 99, 1),
                          fontSize: 16.0),
                    ))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: Text("You can add another profile later?")),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children:  [
                      InkWell(
                        onTap: ()=> Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const PatientSignUpPage())
                        ),
                        child: const ListTile(
                          contentPadding: EdgeInsets.only(left: 0.0),
                          leading: FaIcon(FontAwesomeIcons.hospitalUser),
                          title: Text("Patient Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          ),
                          subtitle:
                              Text("Access all patient resources at no cost"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      const ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        leading: FaIcon(FontAwesomeIcons.stethoscope),
                        title: Text("Doctor Profile",

                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),

                        ),
                        subtitle: Text(
                            "Let patients find you, connect with you and book an appointment with you"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
