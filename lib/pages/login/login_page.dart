import 'package:flutter/material.dart';
import 'package:testing_flutter/pages/home/home_page.dart';
import 'package:testing_flutter/pages/login/widgets/form_container.dart';
import 'package:testing_flutter/pages/login/widgets/signup_button.dart';
import 'package:testing_flutter/pages/login/widgets/stagger_animation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin{

  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
       Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (context) => HomePage())
       );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset('images/login_icon.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignUpButton(),
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
