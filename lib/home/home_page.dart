import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panacare/home/packages_tabview.dart';
import 'package:panacare/home/patient_home_tabview.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
            elevation: 5,

            automaticallyImplyLeading: false,
            // leadingWidth: 0,
            title: const Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image:
                              AssetImage("assets/home/login_user_profile.png"),
                          height: 36.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 204, 204, 204)),
                              ),
                              Text(
                                "Linda Doe",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(120, 59, 99, 1)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )),

                Expanded(
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage("assets/Panacare-High-res.png"),
                          height: 30.0)
                    ],
                  ),
                ),

                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Icon(Icons.notifications)],
                )),
                // Image(image: AssetImage("assets/Panacare-High-res.png"),height: 36.0),
              ],
            )),
        body: TabBarView(
          children: [
            PatientHomeTabBarView(),
            Icon(FontAwesomeIcons.userDoctor),
            Icon(FontAwesomeIcons.streetView),
            PackagesTabview()
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(
              text: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            Tab(
              text: "Providers",
              icon: Icon(FontAwesomeIcons.userDoctor),
            ),
            Tab(
              text: "Visits",
              icon: FaIcon(FontAwesomeIcons.streetView),
            ),
            Tab(
              text: "Packages",
              icon: Icon(Icons.credit_card),
            )
          ],
        ),
      ),
    );
  }
}