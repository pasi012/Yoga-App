import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../CustomFABLocation.dart';

class LessonSingleView extends StatelessWidget {

  var title = "";
  var img = "";

  LessonSingleView({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            img,
            width: double.infinity,
            fit: BoxFit.fill,
            height: 480.h,
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25.0,
                  color: Colors.white,
                )),
          ),
          Positioned(
            bottom: 0,
            left: -20,
            right: -20,
            child: Image.asset(
              'assets/images/img_2.png',
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: CustomFABLocation(
        FloatingActionButtonLocation.endTop, // Base location
        -7.0, // Offset horizontally by 20 logical pixels
        30.0, // Offset vertically by 50 logical pixels
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.close,
          color: Colors.black,
          size: 30,
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: 230.h,
            child: Column(
              children: [
                Image.asset('assets/icons/rectangle_rule.png', width: 50.w, height: 20.h,),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Image.asset('assets/images/img_3.png', width: double.infinity, height: 50.h,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Image.asset('assets/images/img.png', width: 150.w, height: 100.h,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}