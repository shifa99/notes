import 'package:notes_project/features/manage_notes/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.email,
      required super.id,
      required super.image,
      required super.interestId,
      required super.password,
      required super.username});
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        email: data['email'],
        image: data['imageAsBase64'] ?? '',
        id: data['id'],
        interestId: data['intrestId'],
        password: data['password'],
        username: data['username']);
  }
}
