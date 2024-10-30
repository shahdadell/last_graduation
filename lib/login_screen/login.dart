import 'package:flutter/material.dart';
import 'package:last_graduation/app_images/app_images.dart';
import 'package:last_graduation/home_screen/homescreen.dart';
import 'TextFiledLogin.dart';

class Login extends StatelessWidget {
  static const String routName = "login";

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
            appBar: AppBar(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x90f26b0a),
                  ),
                  child: const Text(
                    "زيارة كضيف",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            body: Form(
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
                      child: Container(
                          padding: const EdgeInsets.only(top: 30 ,left: 20,
                          right: 20),
                          margin: EdgeInsets.all(15),
                          width: 330,
                          height: 400,
                          decoration: BoxDecoration(
                              color: Color(0x40ffffff),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              TextFiledLogin(
                                text: 'Email',
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
                              const SizedBox(
                                height: 20,
                              ),
                              TextFiledLogin(
                                password: true,
                                text: 'Password',
                                type: TextInputType.visiblePassword,
                                action: TextInputAction.done,
                                icon: Icons.lock,
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
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      login();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffe37222),
                                        shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
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
                              Spacer(),
                              const Text(
                                "Don't have an account?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          )),
                    )
                  ],
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
