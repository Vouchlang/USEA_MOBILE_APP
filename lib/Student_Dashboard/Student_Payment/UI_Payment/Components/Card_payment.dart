// import 'package:flutter/material.dart';
// import '../Payment_Tuition/Custom_Build_Payment.dart';
// import '/theme_builder.dart';
// import '/Custom_Widget/CustomText.dart';
// import '../../Class_Payment/Class_Payment.dart';

// /// ! card 2
// class PaymentCards2 extends StatelessWidget {
//   const PaymentCards2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(
//             UPdMg5,
//           ),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(
//                 color: ULightGreyColor,
//                 width: 0.5,
//               ),
//               borderRadius: BorderRadius.circular(
//                 URoundedLarge,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 IntrinsicHeight(
//                   child: Padding(
//                     padding: const EdgeInsets.all(
//                       UPdMg5,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         buildHeaderTitle(
//                           75,
//                           'កាលបរិច្ឆេទ',
//                         ),
//                         buildVerticalDividerW_5(),
//                         buildHeaderTitle(
//                           75,
//                           'លេខវិក័យបត្រ',
//                         ),
//                         buildVerticalDividerW_2(),
//                         buildHeaderTitle(
//                           UWidth45,
//                           'ទឹកប្រាក់ត្រូវបង់',
//                         ),
//                         buildVerticalDividerW_2(),
//                         buildHeaderTitle(
//                           UWidth45,
//                           'ទឹកប្រាក់បានបង់',
//                         ),
//                         buildVerticalDividerW_2(),
//                         buildHeaderTitle(
//                           50,
//                           'ទឹកប្រាក់នៅសល់',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 buildDividerAtt(),

//                 // * Body Content​2
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const ScrollPhysics(),
//                   itemCount: paymentData2.length,
//                   itemBuilder: (context, index) {
//                     final isLastIndex = index == paymentData2.length - 1;

//                     return Padding(
//                       padding: EdgeInsets.only(
//                         bottom: isLastIndex ? UPdMg5 : UZeroPixel,
//                       ),
//                       child: IntrinsicHeight(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IntrinsicHeight(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 padding: const EdgeInsets.all(
//                                   UPdMg5,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     // * datePayment
//                                     buildBody(
//                                       75,
//                                       paymentData2[index].datePayment2,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_5(),
//                                     buildBody(
//                                       75,
//                                       paymentData2[index].invoiceNum2,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_2(),
//                                     buildBody(
//                                       UWidth45,
//                                       paymentData2[index].amountToPaid2,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_2(),
//                                     buildBody(
//                                       UWidth45,
//                                       paymentData2[index].amountPaid2,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_2(),
//                                     buildBody(
//                                       UWidth50,
//                                       paymentData2[index].balance2,
//                                       URedColor,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             if (!isLastIndex) buildDividerAtt(),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ! card 3
// class PaymentCards3 extends StatelessWidget {
//   const PaymentCards3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(
//             UPdMg5,
//           ),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(
//                 color: ULightGreyColor,
//                 width: 0.5,
//               ),
//               borderRadius: BorderRadius.circular(
//                 URoundedLarge,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 IntrinsicHeight(
//                   child: Padding(
//                     padding: const EdgeInsets.all(
//                       UPdMg5,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         buildHeaderTitle(
//                           75,
//                           'កាលបរិច្ឆេទ',
//                         ),
//                         buildVerticalDividerW_5(),
//                         buildHeaderTitle(
//                           75,
//                           'លេខវិក័យបត្រ',
//                         ),
//                         buildVerticalDividerW_5(),
//                         buildHeaderTitle(
//                           UWidth45,
//                           'ទឹកប្រាក់ត្រូវបង់',
//                         ),
//                         buildVerticalDividerW_5(),
//                         buildHeaderTitle(
//                           UWidth45,
//                           'ទឹកប្រាក់បានបង់',
//                         ),
//                         buildVerticalDividerW_5(),
//                         buildHeaderTitle(
//                           UWidth50,
//                           'ទឹកប្រាក់នៅសល់',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 buildDividerAtt(),

//                 // * Body Content​3
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const ScrollPhysics(),
//                   itemCount: paymentData3.length,
//                   itemBuilder: (context, index) {
//                     final isLastIndex = index == paymentData3.length - 1;

//                     return Padding(
//                       padding: EdgeInsets.only(
//                         bottom: isLastIndex ? UPdMg5 : UZeroPixel,
//                       ),
//                       child: IntrinsicHeight(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IntrinsicHeight(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 padding: const EdgeInsets.all(
//                                   UPdMg5,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     // * datePayment
//                                     buildBody(
//                                       75,
//                                       paymentData3[index].datePayment3,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_5(),
//                                     buildBody(
//                                       75,
//                                       paymentData3[index].invoiceNum3,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_2(),
//                                     buildBody(
//                                       UWidth45,
//                                       paymentData3[index].amountToPaid3,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_2(),
//                                     buildBody(
//                                       UWidth45,
//                                       paymentData3[index].amountPaid3,
//                                       UTextColor,
//                                     ),
//                                     buildVerticalDividerW_2(),
//                                     buildBody(
//                                       UWidth50,
//                                       paymentData3[index].balance3,
//                                       URedColor,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             if (!isLastIndex) buildDividerAtt(),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
