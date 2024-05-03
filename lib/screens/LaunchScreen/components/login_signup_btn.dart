import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga/screens/RegisterScreen/signup_screen.dart';
import '../../../constants.dart';
import '../../LoginScreen/login_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: const StadiumBorder(),
            maximumSize: Size(double.infinity.w, 40.h),
            minimumSize: Size(double.infinity.w, 40.h),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          child: Text(
            "Get Started",
            style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: Size(double.infinity.w, 40.h),
            minimumSize: Size(double.infinity.w, 40.h),
          ),
          child: Text(
            "Log in",
            style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
