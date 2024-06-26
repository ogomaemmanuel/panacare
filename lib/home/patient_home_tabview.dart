
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientHomeTabBarView extends StatelessWidget {
  const PatientHomeTabBarView({super.key});

  BoxDecoration _cardBorderRadius() {
    return BoxDecoration(
      color: const Color.fromRGBO(41, 170, 225, 1),
      borderRadius: BorderRadius.circular(5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 36.0, right: 36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                child: Text(
                  "Successful!",
                  style: TextStyle(color: Color.fromRGBO(41, 170, 225, 1), fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.zero,
                  child: const Stack(
                    children: [
                      Image(
                        fit: BoxFit.cover,
                        width:double.maxFinite,
                        image: AssetImage("assets/home/patient_home_banner.png"
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16),
                        child: SizedBox(
                          width: 199.0,
                          child: Text(
                            "Exceptional Care for you and your family",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(41, 170, 225, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                        height: 292,
                        decoration: _cardBorderRadius(),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage("assets/icons/doctors.png"),
                                width: 34.37,
                                height: 32.48),
                            Padding(
                              padding: EdgeInsets.only(top: 7.4),
                              child: Text(
                                "Find A Doctor",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        )),
                  )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: Container(
                              height: 135,
                              width: 154,
                              decoration: _cardBorderRadius(),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.heartPulse,
                                      size: 38, color: Colors.white),
                                  Padding(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: Text("Access Health Information",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                        softWrap: true),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          height: 135,
                          width: 154,
                          decoration: _cardBorderRadius(),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.hospital,
                                  size: 33, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(top: 7.4),
                                child: Text(
                                  "Find a Hospital",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Container(
                  width: double.maxFinite,
                  height: 81.0,
                  decoration: _cardBorderRadius(),
                  child: (const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.calendarDays,
                          size: 30, color: Colors.white),
                      Padding(
                        padding: EdgeInsets.only(top: 7.4),
                        child: Text(
                          "Book Appointment",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  )),
                ),
              )
            ]),
      ),
    );
  }
}
