import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';

class BarSearch extends StatelessWidget {
  const BarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 30,
            color: Color(0xFF7C81A1),
          ),
          const SizedBox(width: 28),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: context.text.displayMedium!
                    .copyWith(color: Color(0xFF7C81A1)),
                border: InputBorder.none,
                isCollapsed:
                    true, // removes default vertical padding
              ),

              style: context.text.headlineLarge,
            ),
          ),
          Icon(
            Icons.mic,
            size: 30,
            color: Color(0xFF7C81A1),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class SearchBarwidget extends StatefulWidget {
//   const SearchBarwidget({super.key});

//   @override
//   State<SearchBarwidget> createState() =>
//       _SearchBarwidgetState();
// }

// class _SearchBarwidgetState extends State<SearchBarwidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SearchBar(
//           hintText: 'Search',
//           leading: const Icon(Icons.search),
//           trailing: [
//             Tooltip(
//               message: 'Change brightness mode',
//               child: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.mic_none),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(const SearchBarApp());

// class SearchBarApp extends StatefulWidget {
//   const SearchBarApp({super.key});

//   @override
//   State<SearchBarApp> createState() => _SearchBarAppState();
// }

// class _SearchBarAppState extends State<SearchBarApp> {
//   bool isDark = false;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = ThemeData(
//       brightness: isDark
//           ? Brightness.dark
//           : Brightness.light,
//     );

//     return MaterialApp(
//       theme: themeData,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Search Bar Sample'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SearchBar(
//             // controller: controller,
//             padding:
//                 const WidgetStatePropertyAll<
//                   EdgeInsets
//                 >(
//                   EdgeInsets.symmetric(
//                     horizontal: 16.0,
//                   ),
//                 ),
//             onTap: () {
//               // controller.openView();
//             },
//             onChanged: (_) {
//               // controller.openView();
//             },
//             leading: const Icon(Icons.search),
//             trailing: <Widget>[
//               Tooltip(
//                 message: 'Change brightness mode',
//                 child: IconButton(
//                   isSelected: isDark,
//                   onPressed: () {
//                     setState(() {
//                       isDark = !isDark;
//                     });
//                   },
//                   icon: const Icon(
//                     Icons.wb_sunny_outlined,
//                   ),
//                   selectedIcon: const Icon(
//                     Icons.brightness_2_outlined,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
