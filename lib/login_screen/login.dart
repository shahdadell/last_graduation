import 'package:flutter/material.dart';
import 'package:last_graduation/app_images/app_images.dart';
import 'package:last_graduation/home_screen/homescreen.dart';
import 'TextFiledLogin.dart';

class Login extends StatefulWidget {
  static const String routName = "login";

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
    var theme = Theme.of(context);
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
            body: Center(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          AppImages.group,
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
                                  color: Color(0x40ffffff),
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
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                                          backgroundColor: Color(0xffF26B0A),
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                          .pushNamed(HomeScreen.routName);
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
                        margin: EdgeInsets.only(left: 45, right: 45),
                        width: 18,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              child: Image.asset(
                                AppImages.google,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Please sign in with your email",
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
                        margin: EdgeInsets.only(left: 25, right: 25),
                        width: 20,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                AppImages.facebook3,
                              ),
                            ),
                            const SizedBox(width: 0),
                            const Text(
                              "Please sign in with your Facebook ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context)
                      //         .pushReplacementNamed(HomeScreen.routName);
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: const Color(0x90f26b0a),
                      //   ),
                      //   child: const Text(
                      //     "زيارة كضيف",
                      //     style: TextStyle(
                      //         color: Color(0xffFFFFFF),
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      // ),
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
