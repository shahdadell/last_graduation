import 'package:flutter/material.dart';
import 'package:last_graduation/app_images/app_images.dart';
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
