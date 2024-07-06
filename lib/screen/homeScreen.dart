// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:newsapp/screen/HomePage.dart';
// import 'package:newsapp/screen/HotNews_screen.dart';
// import 'package:newsapp/screen/Profile_screen.dart';
//
// class Home_screen extends StatefulWidget {
//   const Home_screen({super.key});
//
//   @override
//   State<Home_screen> createState() => _Home_screenState();
// }
//
// class _Home_screenState extends State<Home_screen> {
//   PageController pageController = PageController();
//   int selectedindex = 0;
//
//   void itemTap(int index) {
//     setState(() {
//       selectedindex = index;
//     });
//     pageController.jumpToPage(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PageView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: pageController,
//           onPageChanged: (index) {
//             setState(() {
//               selectedindex = index;
//             });
//           },
//           children: [
//             Home(),
//             HotNewsScreen(),
//             Profiles(),
//           ],
//         ),
//         backgroundColor: Color(0xFFF8F9FA),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: selectedindex,
//           onTap: itemTap,
//           backgroundColor: Colors.indigo,
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   CupertinoIcons.home,
//                   color: Colors.white,
//                 ),
//                 activeIcon: Icon(
//                   CupertinoIcons.home,
//                   color: Colors.white,
//                 ),
//                 label: ''),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   CupertinoIcons.news,
//                   color: Colors.white,
//                 ),
//                 activeIcon: Icon(
//                   CupertinoIcons.cart,
//                   color: Colors.white,
//                 ),
//                 label: ''),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   CupertinoIcons.profile_circled,
//                   color: Colors.white,
//                 ),
//                 activeIcon: Icon(
//                   CupertinoIcons.profile_circled,
//                   color: Colors.white,
//                 ),
//                 label: '')
//           ],
//         ));
//   }
// }
