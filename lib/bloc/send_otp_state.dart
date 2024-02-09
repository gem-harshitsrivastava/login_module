part of 'send_otp_bloc.dart';

sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}

final class SendOtpLoading extends SendOtpState {}

final class SendOtpSuccess extends SendOtpState {
  final String response;
  SendOtpSuccess(this.response);
}

final class SendOtpFailure extends SendOtpState {
  final String response;
  SendOtpFailure(this.response);
}
