import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga/screens/LaunchScreen/components/login_signup_btn.dart';

class LaunchScreen extends StatefulWidget {

  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFDBE2EB),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.h,
              ),
              child: Text(
                "keepyoga",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFAFBCCB),
                    fontSize: 23.sp),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Practice yoga",
                style: TextStyle(
                    fontSize: 25.sp,
                    color: const Color(0xFF090A0A),
                    fontWeight: FontWeight.bold)),
          ),
          Text("whenever you want.",
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Stack(
            children: [
              Image.asset(
                'assets/images/launch_img.png',
                width: double.infinity,
                height: 500.h,
                fit: BoxFit.fill,
              ),
              const Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: LoginAndSignupBtn(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
