//
// import 'package:flutter/material.dart';
// import 'package:hala_client_app/core/extension/extensions.dart';
// import 'package:sizer/sizer.dart';
//
//
// class NetworkErrorPage extends StatelessWidget {
//   final dynamic Function(dynamic) callBack;
//
//   const NetworkErrorPage({super.key, required this.callBack});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  SafeArea(
//           child: Container(
//             width: 100.w,
//             height: 100.h,
//             color: Colors.white,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //Image.asset(Assets.assetsImagesNetworkError),
//                   16.sbh,
//                   Text(
//                     "connectionError",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14.sp),
//                   ),
//                   Container(
//                     width: 80.w,
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                     child: Text(
//                       "checkConnection",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           height: 1.8,
//                           fontWeight: FontWeight.w100,
//                           fontSize: 10.sp),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 25.w,
//                     height: 34,
//                     child: MaterialButton(
//                       child: const Icon(
//                         Icons.refresh,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//       ),
//     );
//   }
// }
