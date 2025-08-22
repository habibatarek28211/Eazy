// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NavbarScreen extends StatefulWidget {
//   const NavbarScreen({super.key});

//   @override
//   State<NavbarScreen> createState() => _NavbarScreenState();
// }

// class _NavbarScreenState extends State<NavbarScreen> {
//   int _selectedIndex = 1; // يبدأ بالرئيسية (اللي في النص)

//   final List<Widget> _pages = [
//     Center(child: Text("حسابي", style: TextStyle(fontSize: 22))),
//     Center(child: Text("الرئيسية", style: TextStyle(fontSize: 22))),
//     Center(child: Text("دروسي", style: TextStyle(fontSize: 22))),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],

//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 8,
//         child: SizedBox(
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               // حسابي
//               InkWell(
//                 onTap: () => _onItemTapped(0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.person,
//                         color:
//                             _selectedIndex == 0 ? Colors.blue : Colors.black),
//                     Text(
//                       "حسابي",
//                       style: GoogleFonts.tajawal(
//                         color: _selectedIndex == 0 ? Colors.blue : Colors.black,
//                         fontSize: 12,
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(width: 40), // مساحة للأيقونة الوسطية

//               // دروسي
//               InkWell(
//                 onTap: () => _onItemTapped(2),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.menu_book,
//                         color:
//                             _selectedIndex == 2 ? Colors.blue : Colors.black),
//                     Text(
//                       "دروسي",
//                       style: GoogleFonts.tajawal(
//                         color: _selectedIndex == 2 ? Colors.blue : Colors.black,
//                         fontSize: 12,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // الأيقونة الوسطية (Home)
//       floatingActionButton: FloatingActionButton(
//         backgroundColor:
//             _selectedIndex == 1 ? Colors.blue : Colors.black, // يتغير لونه
//         shape: const CircleBorder(),
//         onPressed: () => _onItemTapped(1),
//         child: const Icon(Icons.home, color: Colors.white),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

//  final List<Widget> _pages = [
//     Center(child: Text("حسابي", style: TextStyle(fontSize: 22))),
//     const HomeBody(), // هنا الصفحة الرئيسية الفعلية
//     Center(child: Text("دروسي", style: TextStyle(fontSize: 22))),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
