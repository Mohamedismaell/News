// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
// import 'package:shimmer/shimmer.dart';

// class TopNewsShimmer extends StatelessWidget {
//   TopNewsShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverList.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey,
//           highlightColor: Colors.white,
//           child: Padding(
//             padding: EdgeInsets.only(bottom: 10.h),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.grey,
//               ),
//               height: 96.h,
//               width: double.infinity,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
