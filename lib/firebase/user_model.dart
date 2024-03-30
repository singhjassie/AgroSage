class UserModel {
  String? uid;
  String? username;
  String? email;
  String? password;
  String? createdAt;
  String? phoneNumber;

  UserModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.createdAt,
    this.phoneNumber,
  });

factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
      
    );
  }
  // Convert UserModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'password': password, // Note: It's generally not recommended to store passwords in plaintext
      'createdAt': createdAt,
      'phoneNumber': phoneNumber,
    };
  }
}