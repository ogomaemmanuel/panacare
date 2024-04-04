import 'package:flutter/material.dart';

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

  List<Doctor> searchDoctors() {
    return List.generate(
        5,
        (index) => Doctor(
            id: "10",
            name: "Dr. James Dew",
            imageUrl: "assets/home/doctor_placeholder.png",
            speciality: "Dermatologist",
            isAvailableToday: true,
            rating: 5,
            ratingCount: 400));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
                child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: IconButton(
                      style: IconButton.styleFrom(
                          foregroundColor:
                              const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                          backgroundColor:
                              const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90)
                                  .toColor()),
                      onPressed: () => _goToBack(context),
                      icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                    ))
              ],
            )),
            const SliverToBoxAdapter(
              child: Row(children: [
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
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            constraints: BoxConstraints(maxHeight: 47),
                            labelText: "Search Location",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(49.0)),
                            ),
                            prefixIcon: Icon(Icons.search)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
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
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
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
            ),
            const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Row(
                                children: [Text("New Search Results",
                                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                                ),
                                )],
                              ),
                )),
            SliverToBoxAdapter(
              child: Container(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(child: DoctorCard());
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  Text(
                    "Saved providers",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  )
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: Container(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(child: DoctorCard());
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Doctor {
  String id;
  String name;
  String imageUrl;
  String speciality;
  bool isAvailableToday;
  int rating;
  int ratingCount;

  Doctor(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.speciality,
      required this.isAvailableToday,
      required this.rating,
      required this.ratingCount});
}
