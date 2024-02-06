import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:learning_project/screens/Homepage.dart';
import 'package:learning_project/screens/Sign_In_Screen.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fname = TextEditingController();
  final pno = TextEditingController();
  final bdate = TextEditingController();
  final email = TextEditingController();
  final psw = TextEditingController();
  final cpsw = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool cpasswordVisible = false;
  @override
  void initState() {
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
                        "assets/lottie/118046-lf20-oahmox5rjson.json",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Sign Up",
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
                      height: 10,
                    ),
                    Container(
                      height: 430,
                      width: 320,
                      //  decoration: BoxDecoration(color: Colors.blue.shade600),
                      child: BlurryContainer(
                        color: Colors.transparent.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: fname,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    label: Text("Full Name"),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(
                                      Icons.person,
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
                                    bool numberValid = RegExp(
                                            r'^(?:\+?88|0088)?01[13-9]\d{8}$')
                                        .hasMatch(value!);

                                    // if (!numberValid) {
                                    //   return "Please enter the proper number";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  style: TextStyle(color: Colors.white),
                                  controller: pno,
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    label: Text("Phone Number"),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(
                                      Icons.call,
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
                                    bool DoB = RegExp(
                                            '(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d')
                                        .hasMatch(value!);

                                    // if (!DoB) {
                                    //   return "please enter the valid DoB";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  onTap: () {
                                    _selecteDate();
                                  },
                                  style: TextStyle(color: Colors.white),
                                  controller: bdate,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    label: Text("Birth Date"),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(
                                      Icons.calendar_month_rounded,
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
                                  controller: cpsw,
                                  obscureText: !cpasswordVisible,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    label: Text("Confirm Password"),
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
                                          cpasswordVisible = !cpasswordVisible;
                                        });
                                      },
                                      icon: cpasswordVisible
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
                                          fname.clear();
                                          pno.clear();
                                          bdate.clear();
                                          email.clear();
                                          psw.clear();
                                          cpsw.clear();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePageScreen()));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Please, Fill this form in proper"),
                                              duration: Duration(seconds: 3),
                                              backgroundColor:
                                                  Colors.indigo.shade200,
                                              elevation: 20,
                                            ),
                                          );
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
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
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
                                      "Already Have an Account ?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(SignInScreen());
                                      },
                                      child: Text(
                                        "Sign In",
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

  Future<void> _selecteDate() async {
    DateTime? _picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
    );
    if (_picker != null) {
      setState(() {
        bdate.text = _picker.toString().split(" ")[0];
      });
    }
  }
}
