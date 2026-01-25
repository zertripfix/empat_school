class Person {
  String _firstName;
  String _lastName;
  String role;

  Person(this._firstName, this._lastName, {this.role = 'Student'});

  String get fullName => '$_firstName $_lastName';

  set firstName(String firstName) {
    _firstName = firstName;
  }

  set lastName(String lastName) {
    _lastName = lastName;
  }
}
