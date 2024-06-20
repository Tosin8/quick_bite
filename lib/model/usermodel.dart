class UserModel {
  final String email;
  final String firstName;
  final String lastName;

  UserModel({required this.email, required this.firstName, required this.lastName});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
