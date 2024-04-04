import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DoctorDetailsPageState();
  }
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Details"),
      ),
      body: const Center(
        child: Text("Doctors Details"),
      ),
    );
  }
}
