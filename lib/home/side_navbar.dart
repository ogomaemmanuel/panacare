import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panacare/help/help_feedback.dart';

import '../subscription/user_subscriptions.dart';

class SideNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
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
          )),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text("Profile"),
          ),
          ListTile(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserSubscriptionsPage()))
            },
            leading: Icon(Icons.credit_card),
            title: Text("My Subscriptions"),
          ),
          const ListTile(
            leading: Icon(Icons.calendar_month_outlined),
            title: Text("Appointments"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpFeedbackPage()))
            },
            child: const ListTile(
              leading: Icon(Icons.help_outline_outlined),
              title: Text("Help & Feedback"),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 26.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }
}
