import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text("Registration",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30.sp)),
                  Text("Create your account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp)),
                ],
              ),
            ),
          ),
          const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: SignUpForm(),
            ),
          ),
        ],
      ),
    );
  }
}
