import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaymentMethodsPageState();
  }
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  var _progress = 0.0;
  var stage = 1;
  var totalSteps = 2;
  String? phoneNumber;
  bool showMpesaForm = false;

  _goToBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _progress = stage / totalSteps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: showMpesaForm
            ? Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () => {},
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(41, 170, 225, 1),
                        foregroundColor: Colors.white),
                    child: Text("Continue")))
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 36.0, right: 36),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                          foregroundColor:
                              const HSLColor.fromAHSL(1.0, 0, 0, 0).toColor(),
                          backgroundColor:
                              const HSLColor.fromAHSL(1.0, 192.0, 0.82, 0.90)
                                  .toColor()),
                      onPressed: () => _goToBack(context),
                      icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                  child: LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      value: _progress),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                        showMpesaForm
                            ? "Confirm MPESA mobile number or enter new one to pay"
                            : "What payment method do you prefer for your subscription?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(120, 59, 99, 1)),
                      ))
                    ],
                  ),
                ),
                showMpesaForm
                    ? _buildMpesaPaymentForm()
                    : Column(
                        children: [
                          Card(
                            child: GestureDetector(
                              onTap: () => {
                                setState(() {
                                  showMpesaForm = true;
                                  stage++;
                                  _progress = stage / totalSteps;
                                })
                              },
                              child: ListTile(
                                title: Text("Mpesa"),
                                subtitle: Text(
                                    "An M-PESA push notification will be sent to you"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          const Card(
                            child: ListTile(
                              title: Text("Card"),
                              subtitle: Text(
                                  "To finish the payment, you need to provide your card information"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ));
  }

  Widget _buildMpesaPaymentForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            autofocus: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Mobile Number")),
            onSaved: (val) => phoneNumber = val!,
          ),
        ),
        Row(children: [
          Flexible(
              child: Text(
                  "This is an M-PESA registered number that the push notification will be sent to"))
        ])
      ],
    );
  }
}
