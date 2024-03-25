
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panacare/auth/login.dart';
import 'package:panacare/registration/sign_up_page.dart';
import 'package:panacare/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Panacare"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const screens = <WelcomeScreen>[
    WelcomeScreen(
      text:
          "Find the best doctor, connect to the doctor and book an appointment",
      imageLocation: "assets/welcome/screen1.png",
    ),
    WelcomeScreen(
      text: "Find a patient, connect with them and schedule an appointment",
      imageLocation: "assets/welcome/screen2.png",
    ),
    WelcomeScreen(
      text:
          "Receive an e-prescription from your doctor and a pharmacy suggestion for your ease",
      imageLocation: "assets/welcome/screen3.png",
    )
  ];

  Widget _buildTabView() {
    return DefaultTabController(
        length: screens.length,
        child: Builder(
            builder: (BuildContext context) => const Expanded(
                    child: Column(children: [
                  Flexible(child: TabBarView(children: screens)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 48.0),
                    child: TabPageSelector(
                      selectedColor: Colors.blue,
                    ),
                  )
                ]))));
  }

  _goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  _goToSignUpPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          _buildTabView(),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      minimumSize:const Size(154, 44),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue),
                    onPressed: () => _goToLoginPage(),
                    child: const Text("Login")),
                OutlinedButton(

                    onPressed: () => _goToSignUpPage(),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        minimumSize:const Size(154, 44),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        backgroundColor: Colors.white),
                    child: const Text("Sign Up"))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
