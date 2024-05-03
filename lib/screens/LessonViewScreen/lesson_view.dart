import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga/constants.dart';
import 'package:yoga/screens/LessonSingleViewScreen/lesson_single_view.dart';
import 'package:yoga/screens/LessonViewScreen/lesson_card_item.dart';

import '../CustomFABLocation.dart';

class LessonView extends StatefulWidget {

  LessonCardItem? item;

  LessonView({super.key, this.item});

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {

  List<LessonCardItem> listLesson = [

    LessonCardItem(
      image: 'assets/images/lessonview1.png',
      title: 'Lesson 01',
    ),
    LessonCardItem(
      image: 'assets/images/lessonview2.png',
      title: 'Lesson 02',
    ),
    LessonCardItem(
      image: 'assets/images/lessonview3.png',
      title: 'Lesson 03',
    ),
    LessonCardItem(
      image: 'assets/images/lessonview4.png',
      title: 'Lesson 04',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/lessonview.png',
            width: double.infinity,
            fit: BoxFit.fill,
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
                  size: 25,
                  color: Colors.white,
                )),
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
            height: 340.h,
            child: Column(
              children: [
                Image.asset('assets/icons/rectangle_rule.png', width: 50.w, height: 20.h,),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Yoga Pilates Full Body',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '5 Lessons',
                      style: TextStyle(color: kPrimaryColor, fontSize: 12.sp),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    height: 340.h,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      separatorBuilder: (context, _) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          buildLessonView(
                        item: listLesson[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildLessonView({
    required LessonCardItem item,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LessonSingleView(
              title: item.title!,
              img: item.image!,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/img.png',
                width: 40.w,
                height: 40.h,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title!,
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(
                Icons.play_circle,
                size: 40.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
