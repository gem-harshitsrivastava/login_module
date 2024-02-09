part of 'send_otp_bloc.dart';

abstract class SendOtpEvent {}

class SendOtp extends SendOtpEvent {
  final String phone;
  SendOtp(this.phone);
}
