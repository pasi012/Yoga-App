import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;

  const MyInputField({super.key, required this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 14),
            height: 50.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              autofocus: false,
              cursorColor: Colors.grey[700],
              controller: controller,
              style: TextStyle(fontSize: 14.0.sp),
              decoration: InputDecoration(
                labelText: title,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: Color(0xb60f0f0f), width: 0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
