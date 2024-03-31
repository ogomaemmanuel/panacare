import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panacare/home/package_card.dart';

class PackagesTabview extends StatelessWidget {
  const PackagesTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(left: 36.0, right: 36.0, top: 16),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(41, 170, 225, 1)),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 23.0, top: 7.0),
                child: Row(children: [
                  Flexible(
                    child: Text(
                      "We promote healthcare through digital inclusivity!",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: Color.fromRGBO(120, 59, 99, 1)),
                    ),
                  )
                ]),
              ),
              Column(
                  children: _getPackages()
                      .map((package) => PackageCard(package: package))
                      .toList())
            ],
          )),
    );
  }

  List<Package> _getPackages() {
    List<Package> packages = [
      Package(
          name: "Heathlink Starter package",
          features: [
            "Viewing doctors",
            "Booking appointments",
            "Integrate into HMIS",
            "Health Education and resources",
            "Referral to friends for discount",
            "Nutrition Package Deal (A patient gets a package of a health nutritionist + doctor + daily coaching + clinic)…Meal Plan?"
          ],
          imageUrl: "assets/icons/package_icon@3x.png"),
      Package(
          name: "Bronze Health Bridge package",
          features: ["Teleconsult", "Internal HMIS"],
          imageUrl: "assets/icons/package_icon@3x.png"),
    ];
    return packages;
  }
}
