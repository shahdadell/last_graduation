import 'package:flutter/material.dart';
import 'package:last_graduation/app_images/app_images.dart';
import 'package:last_graduation/home_screen/homescreen.dart';
import 'package:last_graduation/signup_screen/singup_screen.dart';
import 'textfiled_login.dart';

class Login extends StatefulWidget {
  static const String routName = "login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AppImages.rectangle,
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routName);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    backgroundColor: const Color(0x90f26b0a),
                  ),
                  child: const Text(
                    "Join as a guest",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          AppImages.testgroup,
                        ),
                      ),
                      Image.asset(
                        AppImages.text,
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: Container(
                              padding: const EdgeInsets.only(
                                top: 30,
                                left: 20,
                                right: 20,
                              ),
                              margin: const EdgeInsets.all(15),
                              width: 330,
                              height: 360,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(
                                        10,
                                        10,
                                      ),
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                    ), //BoxShadow
                                  ],
                                  color: const Color(0x40ffffff),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  TextFiledLogin(
                                    text: 'User name / Email',
                                    type: TextInputType.emailAddress,
                                    action: TextInputAction.done,
                                    icon: Icons.email,
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "E-mail is required";
                                      }
                                      bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value);
                                      if (!emailValid) {
                                        return 'PLease Enter Valid Email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFiledLogin(
                                    obsecureText: true,
                                    password: true,
                                    text: 'Password',
                                    type: TextInputType.visiblePassword,
                                    action: TextInputAction.done,
                                    icon: Icons.remove_red_eye,
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is required";
                                      }
                                      if (value != passwordController.value) {
                                        return "Password Doesn't Match";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Forget Password ?",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          login();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xffF26B0A),
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                        child: const Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Don't have an account?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(SignUpScreen.routName);
                                    },
                                    child: const Text(
                                      "Create Account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xffe37222),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 55, right: 55),
                        width: 20,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Color(0xff6378ae),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Image.asset(
                                AppImages.facebook3,
                              ),
                            ),
                            const SizedBox(width: 0),
                            const Text(
                              "Sign in with your facebook ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 70, right: 70),
                        width: 20,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset(
                                AppImages.google,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Sign in with your email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
  void login() {
    if (formKey.currentState?.validate() == true) {}
  }
}
