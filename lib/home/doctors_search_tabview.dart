import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panacare/home/doctor_card.dart';

class DoctorsSearchPage extends StatefulWidget {
  const DoctorsSearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DoctorsSearchPageState();
  }
}

class _DoctorsSearchPageState extends State<DoctorsSearchPage> {
  _goToBack(BuildContext context) {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        body: Padding(
          padding: EdgeInsets.only(top: 36.0, left: 36, right: 36),
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
                        onPressed: () => _goToBack(context),
                        icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                      ))
                ],
              ),

              const Row(children: [
                Flexible(
                  child: Text(
                    "First things first, which Doctor you would like to schedule an appointment with.",
                    style: TextStyle(
                        color: Color.fromRGBO(120, 59, 99, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ]),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Container(
                        // color: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(41, 170, 225, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                            dropdownColor: Color.fromRGBO(41, 170, 225, 1),
                            onChanged: (_) => {},
                            iconEnabledColor: Colors.white,
                            underline: SizedBox(),
                            isExpanded: true,
                            hint: const Text(
                              "Select Speciality",
                              style: TextStyle(color: Colors.white),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: "Dermatologist ",
                                  child: Text(
                                    "Dermatologist",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              DropdownMenuItem(
                                  value: "Cardiologist ",
                                  child: Text(
                                    "Cardiologist",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(41, 170, 225, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          dropdownColor: Color.fromRGBO(41, 170, 225, 1),
                          onChanged: (_) => {},
                          iconEnabledColor: Colors.white,
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: const Text(
                            "Location",
                            style: TextStyle(color: Colors.white),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "Nairobi ",
                                child: Text(
                                  "Nairobi",
                                  style: TextStyle(color: Colors.white),
                                )),
                            DropdownMenuItem(
                                value: "Kisumu ",
                                child: Text(
                                  "Kisumu",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ]),
                    ),
                  ),
                ],
              ),
             Flexible(child: Row(
                children: [Text("New Search Results")],
              )),
              Expanded(
                flex: 8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Expanded(child: DoctorCard()), DoctorCard(), DoctorCard()],
                ),
              ),
             Flexible(child:  Row(
                children: [Text("Saved providers")],
              )),
              Expanded(
                flex: 8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [DoctorCard(), DoctorCard(), DoctorCard()],
                ),
              ),
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
      ),
    );
  }
}
