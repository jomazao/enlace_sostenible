class Coworker {
  String uid;
  String phoneNumber;
  String email;
  String name;
  String surname;

  Coworker({
    this.uid,
    this.phoneNumber,
    this.email,
    this.name,
    this.surname,
  });

  Coworker.fromMap(String uid, Map<String, dynamic> map) {
    this.uid = map['uid'];
    this.phoneNumber = map['phoneNumber'];
    this.email = map['email'];
    this.name = map['name'];
    this.surname = map['surname'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneNumber': this.phoneNumber,
      'email': this.email,
      'name': this.name,
      'surname': this.surname,
    };
  }
}
