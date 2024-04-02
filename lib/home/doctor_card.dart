import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Makes the image circular using CircleAvatar,
          // you can also use cliprect, clip oval
          CircleAvatar(
            radius: 41,
            child:
            Image(image: AssetImage("assets/home/doctor_placeholder.png")),
          ),

          Text(
            "Dr. James Dew",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(120, 59, 99, 1),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
          Text(
            "Gynecologist",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          Container(
            color: Color.fromRGBO(186, 255, 214, 1),
            child: Text(
              "Available Today",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: Colors.blue,
                )),
            Text("9.7(700)")
          ]),
        ],
      ),
    );
  }
}