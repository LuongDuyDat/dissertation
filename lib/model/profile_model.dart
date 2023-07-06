import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  const ProfileModel({required this.name,});

  final String name;

  @override
  List<Object?> get props => [name];
}

class StudentProfileModel extends ProfileModel {
  const StudentProfileModel({required super.name, required this.studentId, required this.classId, required this.facultyId,});

  final String studentId;
  final String classId;
  final String facultyId;

  @override
  List<Object?> get props => [
    name,
    studentId,
    classId,
    facultyId,
  ];
}

StudentProfileModel myProfile1 = const StudentProfileModel(
  name: 'Lương Duy Đạt',
  studentId: '19020039',
  classId: 'K64C-CLC',
  facultyId: 'CN1',
);