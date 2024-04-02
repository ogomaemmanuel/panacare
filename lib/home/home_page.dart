import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panacare/home/doctors_search_tabview.dart';
import 'package:panacare/home/packages_tabview.dart';
import 'package:panacare/home/patient_home_tabview.dart';
import 'package:panacare/home/side_navbar.dart';
import 'package:panacare/home/visits_tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // _openDrawer(BuildContext context){
  //   Scaffold.of(context).openDrawer();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 5,
            automaticallyImplyLeading: false,
            // leadingWidth: 0,
            title:Builder(builder: (context) =>

             Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        GestureDetector(
                          onTap:() => Scaffold.of(context).openDrawer(),
                          child: const Row(
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
                        ),
                      ],
                    )),

                const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage("assets/Panacare-High-res.png"),
                          height: 30.0)
                    ],
                  ),
                ),

                const Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Icon(Icons.notifications_none_outlined)],
                    )),
                // Image(image: AssetImage("assets/Panacare-High-res.png"),height: 36.0),
              ],
            ))),
        body: selectedIndex != 0 ? const PackagesTabview() : const PatientHomeTabBarView(),
        drawer: SideNavBar(),
        //ToDo wrap in NavigationBar instead of TabBar for more control as in
        //https://api.flutter.dev/flutter/material/NavigationBar-class.html
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            if (index == 0 || index == 3) {
              setState(() {
                selectedIndex = index;
              });
            }
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DoctorsSearchPage()));
            };
            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VisitsPage()));
            };
          },
          selectedIndex: selectedIndex,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(
                icon: Icon(FontAwesomeIcons.userDoctor), label: "Providers"),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.streetView), label: "Visits"),
            NavigationDestination(
                icon: Icon(Icons.credit_card), label: "Packages"),
          ],
        ));
  }
}
