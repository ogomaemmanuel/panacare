import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var username = "";
  var password = "";
  var termsAndConditions = false;

  _login() {
    //
  }

  _goToHome(){
    Navigator.pop(context);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  void dispose() {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: IconButton(onPressed: ()=>_goToHome(), icon: const Icon(Icons.arrow_back)),
              )
            ],),

            const Row(
              children: [
                SizedBox(
                    height: 56.0,
                    child: Image(
                        image: AssetImage("assets/Panacare-High-res.png")))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                  autofocus: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email or phone number")),
                    onSaved: (val) => username = val!,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                value: termsAndConditions,
                                onChanged: (val) => {
                                      setState(() {
                                        termsAndConditions = val!;
                                      })
                                    }),
                          ),
                        ),
                        const Flexible(
                            child: Text(
                                "By Logging you confirm to have read, understood and agreed to our terms of service and privacy policy"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: TextButton(
                      onPressed: () => _login(),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.blue)),
                      child: const SizedBox(
                          height: 55.0,
                          width: double.infinity,
                          child: Center(child: Text("Log In"))),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: InkWell(

                        child: const Text("Trouble logging in ?",style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)), onTap: () => {}),
                  )
                ],
              )),
            )
          ],
        ),
      )),
    ));
  }
}
