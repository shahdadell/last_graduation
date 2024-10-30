import 'package:flutter/material.dart';
import 'package:last_graduation/home_screen/homescreen.dart';

import '../custom_filed/custom_filed.dart';

class Login extends StatelessWidget {
  static const String routName = "login";

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/images/Rectangle.png",
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    "assets/images/Group.png",
                  ),
                ),
                Image.asset(
                  "assets/images/text.png",
                ),
                Center(
                  child: Container(
                   // margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(15),
                    width: 330,
                    height: 450,
                    decoration: BoxDecoration(
                        color: Color(0x40ffffff),
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
