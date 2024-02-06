import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:learning_project/screens/Sign_In_Screen.dart';
import 'package:learning_project/screens/Sign_Up_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 838.2,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.yellow.shade300,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/flower.jpg",
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    //color: Colors.white,
                    child: Lottie.asset(
                      "assets/lottie/17179-welcome-title-animation.json",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white30,
                              spreadRadius: 6,
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: BlurryContainer(
                      color: Colors.transparent.withOpacity(0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Hello !",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontFamily: "Pacifico",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Welcome new buddy! ...",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Libre Baskerville",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black38,
                                  side: BorderSide(color: Colors.white),
                                  fixedSize: Size(220, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 24,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Colors.white),
                                  backgroundColor: Colors.black38,
                                  fixedSize: Size(220, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
