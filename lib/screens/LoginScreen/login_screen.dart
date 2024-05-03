import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/login.png',
                width: double.infinity,
                height: 320.h,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: -20,
                left: -20,
                right: -20,
                child: Image.asset(
                  'assets/images/img_1.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
