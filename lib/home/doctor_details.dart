import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DoctorDetailsPageState();
  }
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  _goToBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(318, 55),
              backgroundColor: Color.fromRGBO(41, 170, 225, 1),
              foregroundColor: Colors.white),
          onPressed: () => {},
          child: Text("Book Appointment"),
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage("assets/home/doctor.png"),
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 31,
                    child: IconButton(
                      style: IconButton.styleFrom(
                          foregroundColor:
                              const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                          backgroundColor:
                              const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90)
                                  .toColor()),
                      onPressed: () => _goToBack(context),
                      icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 36.0, right: 36.0, top: 17),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. James Dew",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(120, 59, 99, 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.08),
                              child: Text(
                                "Gynecologist",
                                style: TextStyle(
                                  color: Color.fromRGBO(78, 133, 246, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.46),
                              child: Container(
                                color: Color.fromRGBO(186, 255, 214, 1),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 12),
                                  child: Text(
                                    "Available Today",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.96),
                                  child: Icon(Icons.pin_drop, size: 21.99),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: Text("Location",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Text("Mater Hospital, Westlands",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(95, 99, 104, 1)))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("4.7"),
                                  ...List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            size: 17,
                                            color: Colors.blue,
                                          )),
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Text("700 Ratings")]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Text("View reviews")]),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.97),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.97),
                      child: Text(
                          "I believe my role as your Gynecologist is to help you better understand your health and help you navigate through treatment options to find the best management for your individual situation."),
                    )
                  ],
                ),
              ),
            ],
          )),
        ]));
  }
}
