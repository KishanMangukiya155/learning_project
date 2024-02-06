import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:learning_project/Auth/Google_services_.dart';
import 'package:learning_project/screens/Sign_Up_Screen.dart';
import 'package:lottie/lottie.dart';
import 'Homepage.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController();
  final psw = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                height: 838,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  image: DecorationImage(
                      image: AssetImage("assets/images/blue.jpg"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Lottie.asset(
                        "assets/lottie/93385-login.json",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          shadows: [
                            Shadow(
                                color: Colors.pink.shade200,
                                blurRadius: 4,
                                offset: Offset(4, 2))
                          ],
                          fontFamily: "Libre Baskerville",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 350,
                      width: 320,
                      //  decoration: BoxDecoration(color: Colors.blue.shade600),
                      child: BlurryContainer(
                        color: Colors.transparent.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    bool emailValid = RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(value!);

                                    if (!emailValid) {
                                      return "please enter the valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(color: Colors.white),
                                  controller: email,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    label: Text("Email Address"),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.indigo.shade400,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.pink.shade400,
                                          width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    bool passwordValid = RegExp(
                                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                        .hasMatch(value!);

                                    if (!passwordValid) {
                                      return "please enter the valid password format in 1 char \nuppercase , lowercase , number or symbol";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(color: Colors.white),
                                  controller: psw,
                                  obscureText: !passwordVisible,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    label: Text("Password"),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },
                                      icon: passwordVisible
                                          ? Icon(
                                              Icons.visibility,
                                              color: Colors.blue,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: Colors.blue,
                                            ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.indigo.shade400,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.pink.shade400,
                                          width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (formkey.currentState!.validate()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePageScreen()));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "Please, Fill this form in proper"),
                                            duration: Duration(seconds: 3),
                                            backgroundColor:
                                                Colors.indigo.shade200,
                                            elevation: 20,
                                          ));
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(color: Colors.white),
                                        backgroundColor: Colors.black38,
                                        fixedSize: Size(220, 45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                    child: Center(
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      signInWithGoogle().then(
                                          (value) => Get.to(HomePageScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(color: Colors.white),
                                        backgroundColor: Colors.black38,
                                        fixedSize: Size(220, 45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              //color: Colors.red,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/google.png"))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Sign In With Google",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't Have an Account ?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(SignUpScreen());
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.indigo.shade100,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.pink.shade200,
                                                  blurRadius: 4,
                                                  offset: Offset(4, 2))
                                            ],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
