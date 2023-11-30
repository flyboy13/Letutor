class Account {
  String _imageUrl;
  String _name;
  String _email;
  String _country;
  String _phone;
  DateTime _birthday;
  List<String> _wantToLearn;
  String _note;

  Account(this._imageUrl, this._name, this._email, this._country, this._phone,
      this._birthday, this._wantToLearn, this._note);

  String getterName() {
    return _name;
  }

  String getterImageUrl() {
    return _imageUrl;
  }

  String getterEmail() {
    return _email;
  }

  String getterCountry() {
    return _country;
  }

  DateTime getterBirthday() {
    return _birthday;
  }

  List<String> getterWantToLearn() {
    return _wantToLearn;
  }

  String getterNote() {
    return _note;
  }

  String getterPhone() {
    return _phone;
  }

//Setter

  void setterNote(String note) {
    _note = note;
  }

  void setterName(String name) {
    _name = name;
  }

  void setterImageUrl(String name) {
    _imageUrl = name;
  }

  void setterEmail(String email) {
    _email = email;
  }

  void setterCountry(String country) {
    _country = country;
  }

  void setterPhone(String phone) {
    _phone = phone;
  }

  void setterBirthday(String birthday) {
    DateTime temp = DateTime.parse(birthday);
    _birthday = temp;
  }

  void setterWantToLearn(List<String> wantToLearn) {
    _wantToLearn = wantToLearn;
  }
}
