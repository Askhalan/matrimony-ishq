class JValidator {
//--------------------- Email Validator ---------------------

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

//--------------------- Email Validator ---------------------

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

//--------------------- Password Validator ---------------------

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  //--------------------- Confirm Password Validator ---------------------

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is required.';
    }

    if (confirmPassword != password) {
      return 'Passwords does not match.';
    }

    return null;
  }

//--------------------- Phone Number Validator ---------------------

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (10 digits)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number.';
    }

    return null;
  }

  //--------------------- Basic Details Page Validator ---------------------
  static bool areFormFieldsFilled({
    required String physicalStatus,
    required String profileFor,
    required String selectedGender,
    required String maritalStatus,
    required DateTime? selectedDate,
  }) {
    if (physicalStatus.isEmpty &&
        profileFor.isEmpty &&
        selectedGender.isEmpty &&
        maritalStatus.isEmpty &&
        selectedDate == null) {
      return false;
    }
    return true;
  }

//-------------------- Professional Details Page Validator ------------------

  static bool validateProfessionalDetails({
    required String education,
    required String employedIn,
    required String occupation,
  }) {
    if (education.isEmpty && employedIn.isEmpty && occupation.isEmpty) {
      return false;
    }
    return true;
  }

  //-------------------- Family Details Page Validator ------------------

  static bool validateFamilyDetails({
    required String value,
    required String type,
    required String status,
    required String about,
  }) {
    if (value.isEmpty && type.isEmpty && status.isEmpty && about.isEmpty) {
      return false;
    }
    return true;
  }
}
