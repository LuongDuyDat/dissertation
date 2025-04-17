import 'package:learning_intern_support_system/domain/entities/student.dart';

class UserModel {
  final String email;
  final String name;
  final String id;
  final String gender;
  final String address;
  final DateTime birthDay;
  final String classId;
  final String phoneNumber;
  final String avatarPath;
  final List<String> cv;

  UserModel({
    required this.email,
    required this.name,
    required this.id,
    required this.gender,
    required this.address,
    required this.birthDay,
    required this.classId,
    required this.phoneNumber,
    required this.avatarPath,
    required this.cv,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final student = map['student'];
    return UserModel(
      email: map['email'] ?? '',
      id: student['id']?.toString()  ?? '' ,
      name: student['name'] ?? '',
      gender: student['gender'] ?? '',
      address: student['address'] ?? '',
      birthDay: DateTime.parse(student['birthday']),
      classId: student['className'] ?? '',
      phoneNumber: student['phoneNumber'] ?? '',
      avatarPath: student['avatarPath'] ?? '',
      cv: List<String>.from(student['studentCvs'] ?? []),
    );
  }

}

extension UserXModel on UserModel {
  StudentEntity toStudentEntity() {
    return StudentEntity(
        email: email,
        name: name,
        id: id,
        gender: gender,
        address: address,
        birthDay: birthDay,
        classId: classId,
        phoneNumber: phoneNumber,
        avatarPath: avatarPath,
        cv: cv,
    );
  }
}