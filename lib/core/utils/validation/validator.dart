class ValidatorTextField {
  static final RegExp mobileRegExp = RegExp(r'^(?:\+880|880|0)?1[3-9]\d{8}$');
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? emailValidCheck({String? email}) {
    if (email == null || email.trim().isEmpty) {
      return "Please Enter Email";
    }
    if (!emailRegex.hasMatch(email)) {
      return "Invalid Email";
    }
    return null;
  }

  static String? passwordValidCheck({String? password}) {
    if (password == null || password.trim().isEmpty) {
      return 'Please Enter Password';
    }
    if (password.length < 6) {
      return 'Password minimum 6 characters';
    }
    return null;
  }

  static String? validNumberCheck({String? phone}) {
    if (phone == null || phone.trim().isEmpty) {
      return "Please Enter Phone Number";
    }
    if (!mobileRegExp.hasMatch(phone)) {
      return "Invalid Phone Number";
    }
    return null;
  }

  static String? validNameCheck({String? name}) {
    if (name == null || name.trim().isEmpty) {
      return "Please Enter Full Name";
    }

    return null;
  }
}
