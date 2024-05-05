import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga/screens/LoginScreen/login_screen.dart';
import '../../../constants.dart';
import '../../input_field.dart';
import 'package:http/http.dart' as http;

void register(String name, email, gender, password, BuildContext context) async {

  var url = 'http://84.46.249.96:5000/api/v1/auth/register';
  var response = await http.post(
    Uri.parse(url),
    body: {
      "username": name,
      "email": email,
      "gender": gender,
      "password": password
    },
  );

  if (response.statusCode == 200) {

    if(response.body.compareTo("email") != email){

      var jsonResponse = jsonDecode(response.body);
      var token = jsonResponse['token'];
      print('Registration Successful: $token');

      Fluttertoast.showToast(
          msg: 'Registration Successful!',
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
            return const LoginScreen();
          },
        ),
      );

    } else {

      Fluttertoast.showToast(
          msg: "User already exists!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }

  } else {

    Fluttertoast.showToast(
        msg: 'Failed to register: Please check all Field',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _handleRegister() {
    register(_nameController.text, _emailController.text, _genderController.text, _passwordController.text, context);
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
              title: "user name",
              controller: _nameController,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MyInputField(
                  title: "gender",
                  controller: _genderController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyInputField(
                  title: "age",
                  controller: _ageController,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: MyInputField(
              title: "password",
              controller: _passwordController,
            ),
          ),
          MyInputField(
            title: "confirm password",
            controller: _confirmPasswordController,
          ),
          SizedBox(
            height: 100.h,
          ),
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

              if(_passwordController.text == _confirmPasswordController.text){
                _handleRegister();
              } else {
                Fluttertoast.showToast(
                    msg: "password not match!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }

            },
            child: Text(
              "Create Account",
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
