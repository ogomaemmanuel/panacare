import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpFeedbackPage extends StatefulWidget {
  const HelpFeedbackPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HelpFeedbackPageState();
  }
}

class _HelpFeedbackPageState extends State<HelpFeedbackPage> {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? subject;
  void _login() {
    final form = formKey.currentState;
    if (form?.validate() ?? false) {
      form?.save();
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 36.0, right: 36),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                            foregroundColor:
                                const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                            backgroundColor:
                                const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90)
                                    .toColor()),
                        onPressed: () => {Navigator.pop(context)},
                        icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                      ),
                    ],
                  ),
                ),
                Row(
                  key: formKey,
                  children: const [
                    Flexible(
                        child: Text(
                            "If you're troubled by something, feel free to request information and advice online.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(120, 59, 99, 1),
                                fontSize: 18)))
                  ],
                ),
                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "What is your name"),
                          onSaved: (val) => email = val!,
                          keyboardType: TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Mobile Number"),
                          onSaved: (val) => email = val!,
                          keyboardType: TextInputType.phone),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              hintText: "Type here",
                              border: OutlineInputBorder(),
                              labelText: "Email Address"),
                          onSaved: (val) => email = val!,
                          keyboardType: TextInputType.emailAddress),
                    ),
                    //Example found here https://blog.logrocket.com/creating-dropdown-list-flutter/
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) =>
                              value == null ? "Select a country" : null,
                          value: subject,
                          onChanged: (String? newValue) {
                            setState(() {
                              subject = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(value: "USA", child: Text("USA")),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextFormField(
                          minLines: 6,
                          maxLines: null,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email Address"),
                          onSaved: (val) => email = val!,
                          keyboardType: TextInputType.multiline),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: TextButton(
                                onPressed: () => _login(),
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(41, 170, 225, 1),
                                    foregroundColor: Colors.white),
                                child: const Text("Continue")),
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
