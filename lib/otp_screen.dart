

// import 'package:flutter/material.dart';

// String getOtpFromFields(List<TextEditingController> controllers) {
//   String otp = '';
//   for (TextEditingController controller in controllers) {
//     otp += controller.text;
//   }
//   return otp;
// }

// class EnterOtpPage extends StatelessWidget {
  
//   final String phnumber;
//   final UserService userService = UserService();
//   EnterOtpPage({ required this.phnumber, super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<TextEditingController> otpControllers =
//         List.generate(6, (index) => TextEditingController());
//     VerifyOTPBloc verifyOTPBloc = BlocProvider.of<VerifyOTPBloc>(context);
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: const Color(0xFF2C9EE0),
//       //   leading: IconButton(
//       //     icon: const Icon(Icons.arrow_back),
//       //     color: Colors.white,
//       //     onPressed: () {
//       //       Navigator.pop(context);
//       //     },
//       //   ),
//       // ),
//       body: Container(
//         color: const Color(0xFF2C9EE0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Upper half with dairy_go_logo
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: Image.asset("assets/images/dairy_go_logo.png"),
//               ),

//               // White rounded box element
//               Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Image of security
//                     Padding(
//                       padding: const EdgeInsets.only(top: 50, bottom: 20),
//                       child: Image.asset("assets/images/Otp.png"),
//                     ),
//                     const SizedBox(height: 10),
//                     const CustomText(
//                       text: 'OTP Verification',
//                       size: 20,
//                       color: ColorConstants.SecondaryColor,
//                       weight: FontWeight.w600,
//                     ),
//                     // Interpolate the mobile number from the service
//                     const SizedBox(height: 10),
//                     const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 15, vertical: 0),
//                       child: CustomText(
//                         text: 'Enter OTP code sent to your number +91',
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: ColorConstants.SecondaryColor,
//                       ),
//                     ),

//                     // Text(
//                     //   'Please enter the 4-digit OTP sent to +91 ${userService.mobileNumber}',
//                     //   style: const TextStyle(
//                     //     color: Color.fromARGB(255, 41, 40, 40),
//                     //   ),
//                     // ),
//                     const SizedBox(height: 20),

//                     // Input text widget to enter OTP
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           // Create 4 boxes for the OTP
//                           for (int i = 0; i < 6; i++)
//                             SizedBox(
//                               width: 50,
//                               height: 50,
//                               child: TextFormField(
//                                 autofocus: i == 0, // Autofocus on the first box
//                                 keyboardType: TextInputType.number,
//                                 maxLength: 1,
//                                 textAlign: TextAlign.center,
//                                 controller: otpControllers[i],

//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                   counterText: '',
//                                 ),
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 onChanged: (value) {
//                                   // Focus on the next box when a digit is entered
//                                   if (value.length == 1 && i < 5) {
//                                     FocusScope.of(context).nextFocus();
//                                   }
//                                 },
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Proceed button with less roundness
//                     BlocConsumer<VerifyOTPBloc, VerifyOTPState>(
//                         listener: (context, state) {
//                       if (state is VerifyOTPError) {
//                         print('send otp error');
//                       }

//                       if (state is VerifyOTPSuccess) {
//                         Navigator.pushNamedAndRemoveUntil(
//                             context, '/otp_screen', (route) => false);
//                       }
//                     }, builder: (context, state) {
//                       if (state is VerifyOTPLoading) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                       if (state is VerifyOTPSuccess) {
//                         // Add logic to validate OTP and navigate to the dashboard
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const Dashboard(),
//                           ),
//                         );
//                       }
//                       return InkWell(
//                           onTap: () {
//                             String OTPEntered =
//                                 getOtpFromFields(otpControllers);
//                             VerifyOTPRequestModel model = VerifyOTPRequestModel(
//                                 number: phnumber, otp: OTPEntered);
//                             verifyOTPBloc.add(VerifyOTPRequestEvent(model));
//                           },
//                           child: const CustomButton(
//                             text: 'Login',
//                           ));
//                     }),
//                     const SizedBox(height: 100),
//                     const Text(
//                       'Or Login With',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 41, 40, 40),
//                         fontSize: 14,
//                       ),
//                     ),

//                     // G+ button
//                     Container(
//                       width: 120, // Set the desired width
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Add logic for G+ login
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red, // Set background color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                                 20), // Rounded corners for a bubble effect
//                           ),
//                         ),
//                         child: const Text('G+',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16)),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
