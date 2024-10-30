import 'package:flutter/material.dart';
import 'package:last_graduation/login_screen/login.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = "home" ;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/images/Vector2.png",
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/images/Vector.png",
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(Login.routName);
              },
            ),
          ),
        )
      ],
    );
  }
}
