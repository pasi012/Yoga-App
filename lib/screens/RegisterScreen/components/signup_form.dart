import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';
import '../../input_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          MyInputField(
            title: "Email",
            controller: emailController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding/4),
            child: MyInputField(
              title: "user name",
              controller: nameController,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MyInputField(
                  title: "gender",
                  controller: genderController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyInputField(
                  title: "age",
                  controller: ageController,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding/4),
            child: MyInputField(
              title: "password",
              controller: passwordController,
            ),
          ),
          MyInputField(
            title: "confirm password",
            controller: confirmPasswordController,
          ),
          SizedBox(height: 100.h,),
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
              //allowAdminToRegister();
            },
            child: Text(
              "Create Account",
              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
