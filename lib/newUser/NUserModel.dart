class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? societyName;
  String? userType;
  String? wing;
  String? flatNo;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.societyName,
      this.userType,
      this.wing,
      this.flatNo});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      societyName: map['societyName'],
      userType: map['userType'],
      wing: map['wing'],
      flatNo: map['flatNo'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'societyName': societyName,
      'userType': userType,
      'wing': wing,
      'flatNo': flatNo,
    };
  }
}
