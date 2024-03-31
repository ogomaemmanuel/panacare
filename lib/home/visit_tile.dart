import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VisitTile extends StatelessWidget {
  Visit visit;

  VisitTile({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined),
              Flexible(
                child: Container(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            ],
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 32),
                child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                Text(
                  visit.hospitalName,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 3, 6, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  visit.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Color.fromRGBO(112, 112, 112, 1)),
                ),
                Text(visit.visitDate.toLocal().toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Color.fromRGBO(112, 112, 112, 1))),
                            ],
                          ),
              )),
        ],
      ),
    );
  }
}

class Visit {
  DateTime visitDate;
  String address;
  String hospitalName;

  Visit(
      {required this.visitDate,
      required this.address,
      required this.hospitalName});
}
