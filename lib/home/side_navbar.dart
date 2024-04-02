import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
              child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage(
                                "assets/home/login_user_profile.png"),
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
                                      color:
                                          Color.fromARGB(255, 204, 204, 204)),
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
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Icon(Icons.notifications_none_outlined)],
                  )),
              // Image(image: AssetImage("assets/Panacare-High-res.png"),height: 36.0),
            ],
          ))
        ],
      ),
    );
  }
}
