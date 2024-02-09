import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_module/send_otp_repo.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final SendOTPRepository _sendOTPRepository;
  SendOtpBloc(this._sendOTPRepository) : super(SendOtpInitial()) {
    on<SendOtp>((event, emit) async {
      emit(SendOtpLoading());
      try {
        var response = await _sendOTPRepository.sendOTP(event.phone);
        emit(SendOtpSuccess('$response'));
      } catch (e) {
        emit(SendOtpFailure('$e'));
      }
    });
  }
}
