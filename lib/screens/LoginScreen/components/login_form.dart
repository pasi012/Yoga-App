import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga/screens/HomeScreen/home_screen.dart';
import '../../../constants.dart';
import '../../input_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void login(String email, String password, BuildContext context) async {

  var url = 'http://84.46.249.96:5000/api/v1/auth/login';
  var response = await http.post(
    Uri.parse(url),
    body: {'email': email, 'password': password},
  );

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var token = jsonResponse['token'];
    print('Login successful: $token');

    Fluttertoast.showToast(
        msg: 'Login successful!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    );
  } else {

    Fluttertoast.showToast(
        msg: 'Failed to login: Please check Email & Password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print('Failed to login');
    // Handle error
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    login(_emailController.text, _passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          MyInputField(
            title: "Email",
            controller: _emailController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: MyInputField(
              title: "password",
              controller: _passwordController,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  //
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: const Color(0xFF6B4EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              )),
          const SizedBox(height: defaultPadding * 4),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "By continuing, you agree to our Terms of Service and Privacy Policy.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: Size(double.infinity, 40.h),
              minimumSize: Size(double.infinity, 40.h),
            ),
            onPressed: () {
              _handleLogin();
            },
            child: Text(
              "Log in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
