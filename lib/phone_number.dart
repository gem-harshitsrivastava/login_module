import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_module/bloc/send_otp_bloc.dart';
import 'package:login_module/button_widget.dart';
import 'package:login_module/login_service.dart';
import 'package:login_module/text_form_field_widget.dart';
import 'package:login_module/text_widget.dart';

class UserLogin extends StatelessWidget {
  final UserService userService = UserService();
  UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final _formfield = GlobalKey<FormState>();
    final phoneController = TextEditingController();
    SendOtpBloc sendOTPBloc = BlocProvider.of<SendOtpBloc>(context);

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xFF2C9EE0),
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //       color: Colors.white,
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        body: Container(
      color: const Color(0xFF2C9EE0),
      child: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upper half with dairy_go_logo
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset("assets/images/dairy_go_logo.png"),
              ),

              // White rounded box element
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image of smartphone
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Image.asset("assets/images/Smartphone.png"),
                    ),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'Login with Mobile Number',
                      size: 20,
                      color: Colors.amber,
                      weight: FontWeight.w600,
                    ),

                    const SizedBox(height: 10),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: CustomText(
                        text:
                            'We will send you a One Time Password on your phone number',
                        size: 14,
                        weight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextFormFieldWidget(
                      hintText: 'Enter your mobile number (+91)',
                      controller: phoneController,
                    ),

                    SizedBox(height: 20),

                    // Next button with less roundness
                    BlocConsumer<SendOtpBloc, SendOtpState>(
                        listener: (context, state) {
                      if (state is SendOtpFailure) {
                        print('send otp error');
                      }

                      if (state is SendOtpSuccess) {
                        Navigator.pushNamed(context, '/otp_screen');
                      }
                    }, builder: (context, state) {
                      if (state is SendOtpLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          // SendOTPRequestModel model = SendOTPRequestModel(
                          //   number: int.parse(phoneController.text),
                          // );
                          sendOTPBloc
                              .add(SendOtp('{int.parse(phoneController.text}'));

                          //userService.saveMobileNumber("9878860872");
                          // Add logic to send OTP and navigate to the next screen

                          Navigator.pushNamed(context, 'verify-otp');

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => EnterOtpPage(
                          //       phnumber: phoneController.text,
                          //     ),
                          //   ),
                          // );
                        },
                        child: const CustomButton(text: 'Get OTP'),
                      );
                    }),

                    const SizedBox(height: 50),
                    // Or Login With text
                    const CustomText(
                      text: 'or Login with',
                      size: 14,
                      color: Colors.cyan,
                      weight: FontWeight.w400,
                    ),

                    // G+ button
                    Container(
                      width: 120, // Set the desired width
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add logic for G+ login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Set background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Rounded corners for a bubble effect
                          ),
                        ),
                        child: const Text('G+',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
