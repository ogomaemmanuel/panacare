import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorsSearchPage extends StatefulWidget {
  const DoctorsSearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DoctorsSearchPageState();
  }
}

class _DoctorsSearchPageState extends State<DoctorsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(36.0),
      child: Column(
        children: [
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
                      hint: Text(
                        "Select Speciality",
                        style: TextStyle(color: Colors.white),
                      ),
                      items: [
                        DropdownMenuItem(
                            value: "Dermatologist ",
                            child: Text("Dermatologist")),
                        DropdownMenuItem(
                            value: "Cardiologist ",
                            child: Text("Cardiologist")),
                      ]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
