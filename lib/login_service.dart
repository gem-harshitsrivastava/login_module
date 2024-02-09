// user_service.dart
class UserService {
  String? _mobileNumber;

  String? get mobileNumber => _mobileNumber;

  void saveMobileNumber(String mobileNumber) {
    _mobileNumber = mobileNumber;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return 'Invalid mobile number format';
    }
    return null;
  }
}
