import 'package:flutter/material.dart';
import 'package:last_graduation/app_images/app_images.dart';
import 'package:last_graduation/login_screen/login.dart';
import 'package:last_graduation/signup_screen/textfiled_signup.dart';

class SignUpScreen extends StatefulWidget {
  static const String routName = "signup";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AppImages.vector2,
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppImages.vector1,
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Login.routName);
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset(
                        AppImages.group2,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 20,
                          right: 20,
                        ),
                        margin: const EdgeInsets.all(15),
                        width: 400,
                        height: 460,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(
                                  15,
                                  15,
                                ),
                                blurRadius: 10,
                                spreadRadius: 3,
                              ), //BoxShadow
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFiledSingup(
                                controller: nameController,
                                text: 'User Name',
                                icon: Icons.person,
                                hint: 'Enter Your Name',
                                type: TextInputType.name,
                                action: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Name is required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFiledSingup(
                                controller: emailController,
                                text: 'E-mail',
                                icon: Icons.mail,
                                hint: 'Enter Your Email',
                                type: TextInputType.emailAddress,
                                action: TextInputAction.done,
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
                              TextFiledSingup(
                                controller: passwordController,
                                text: 'Password',
                                icon: Icons.remove_red_eye,
                                hint: 'Enter Your Password',
                                type: TextInputType.visiblePassword,
                                action: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password is required";
                                  }
                                  if (value.length < 6) {
                                    return "Password Should Be At Least 6 Chars";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFiledSingup(
                                password: true,
                                controller: confirmPassController,
                                text: 'Confirmation Password',
                                icon: Icons.remove_red_eye,
                                hint: 'Confirmation Your Password',
                                type: TextInputType.visiblePassword,
                                action: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Confirmation Password is required";
                                  }
                                  if (value != passwordController.value) {
                                    return "Password Doesn't Match";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 60),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      register();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffF26B0A),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    child: const Text(
                                      "SignUp",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {}
  }
}
