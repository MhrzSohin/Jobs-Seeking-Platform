 class Validationcomponent {
  String? emailValidation(value) {
    if (value!.isEmpty) {
      return 'Please Enter Email';
    } else if (!(value!.toString().contains('@') &&
        value!.toString().contains('.com'))) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value!.isEmpty) {
      return 'Please Enter Password';
    } else if (value!.toString().length < 7) {
      return 'Password must have 8 characters';
    }
    return null;
  }
}
