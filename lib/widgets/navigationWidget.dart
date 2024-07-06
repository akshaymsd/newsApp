// import 'package:flutter/material.dart';
// import 'package:newsapp/screen/Favourites_screen.dart';
// import 'package:newsapp/screen/HomePage.dart';
// import 'package:newsapp/screen/Profile_screen.dart';
//
// class NavigationWidget extends StatefulWidget {
//   const NavigationWidget({super.key});
//
//   @override
//   State<NavigationWidget> createState() => _NavigationWidgetState();
// }
//
// class _NavigationWidgetState extends State<NavigationWidget> {
//   int _currentindex = 0;
//   List Pages = [Home(), Favourites(), Profiles()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 25),
//         ]),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: BottomNavigationBar(
//             backgroundColor: Colors.white,
//             selectedItemColor: Colors.amber,
//             unselectedItemColor: Colors.black,
//             currentIndex: _currentindex,
//             onTap: (index) {
//               setState(() {
//                 _currentindex = index;
//               });
//             },
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home_outlined), label: "Home"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite_border), label: "Favourite"),
//               BottomNavigationBarItem(icon: Icon(Icons.face), label: "Profile")
//             ],
//           ),
//         ),
//       ),
//       body: Pages[_currentindex],
//     );
//   }
// }
