import 'package:flutter/material.dart';
import 'package:panacare/home/visit_tile.dart';
class VisitsPage extends StatefulWidget {
  const VisitsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VisitsPageState();
  }
}

class _VisitsPageState extends State<VisitsPage> {
  List<Visit> visits = [
    Visit(
        visitDate: DateTime.now(),
        address: "Dunga Road, South B",
        hospitalName: "Mater Hospital"),
    Visit(
        visitDate: DateTime.now(),
        address: "Upper Hill , Nairobi",
        hospitalName: "Aga Khan University Hospital"),
    Visit(
        visitDate: DateTime.now(),
        address: "Upper Hill , Nairobi",
        hospitalName: "AAR Healthcare"),
    Visit(
        visitDate: DateTime.now(),
        address: "Upper Hill , Nairobi",
        hospitalName: "Nairobi Hospital"),
    Visit(
        visitDate: DateTime.now(),
        address: "Upper Hill , Nairobi",
        hospitalName: "Dr. James Chanjo")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 36.0, top: 28, right: 36.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Visits",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(120, 59, 99, 1)),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom:28.0, top: 12),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxHeight:47,maxWidth: 318),
                                labelText: "Search Location",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(49.0)),

                                ),
                                prefixIcon: Icon(Icons.search)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children:
                        visits.map((visit) => VisitTile(visit: visit)).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 19.0),
                    child: TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: const Color.fromRGBO(41, 170, 225, 1),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(318, 71)),
                        child: const Text("Last Visit")),
                  )
                ],
              ),
            )));
  }
}
