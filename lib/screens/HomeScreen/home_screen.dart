import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga/screens/HomeScreen/tile_item.dart';
import 'package:yoga/screens/LessonViewScreen/lesson_view.dart';
import 'package:yoga/screens/LoginScreen/login_screen.dart';
import 'card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CardItem> items = [
    const CardItem(
      image: 'assets/images/pull_body.png',
      title: 'Full Body',
    ),
    const CardItem(
      image: 'assets/images/upper_body.png',
      title: 'Upper Body',
    ),
    const CardItem(
      image: 'assets/images/lower_body.png',
      title: 'Lower Body',
    ),
    const CardItem(
      image: 'assets/images/pippop.png',
      title: 'Hip And',
    ),
  ];

  List<TileItem> listTile = [
    const TileItem(
      image: 'assets/images/tile_img1.png',
    ),
    const TileItem(
      image: 'assets/images/tile_img2.png',
    ),
    const TileItem(
      image: 'assets/images/tile_img3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Good Morning',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            icon: Image.asset(
              "assets/icons/avatar.png",
              width: 33.w,
              height: 33.h,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            icon: Image.asset(
              "assets/icons/exit.png",
              width: 28.w,
              height: 28.h,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //category Group
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
              child: SizedBox(
                height: 140.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) => buildCard(
                    item: items[index],
                  ),
                ),
              ),
            ),
            //container
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20.0, bottom: 20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              'Basic Yoga',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Lorem Ipsum is simply dummy text of',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'the printing and typesetting industry.',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            color: Colors.white,
                            iconSize: 30.w,
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 10.0,
                top: 10.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Sessions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //Scrollview
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
              child: SizedBox(
                height: 245.h,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  separatorBuilder: (context, _) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) => buildTile(
                    item: listTile[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0.w,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.circle_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite_border_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.circle_outlined),
          )
        ],
      ),
    );
  }

  Widget buildTile({
    required TileItem item,
  }) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
          child: Row(
            children: [
              Image.asset(
                item.image,
                height: 80.h,
                width: 80.w,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yoga Pilates',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    '5 lessons          ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Text('By Sarah William', style: TextStyle(fontSize: 12.sp),),
                      Text(' . All Level . ', style: TextStyle(fontSize: 12.sp),),
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 3,),
                      Text('4.5', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: GestureDetector(
        onTap: (){
          if(item.title == 'Full Body'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LessonView()));
          }
        },
        child: Column(
          children: [
            Image.asset(
              item.image,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}
