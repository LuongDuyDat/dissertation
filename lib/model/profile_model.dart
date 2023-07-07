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

class TeacherProfileModel extends ProfileModel {
  const TeacherProfileModel({required super.name, required this.faculty, required this.degree, required this.gender,});

  final String faculty;
  final String degree;
  final String gender;

  @override
  List<Object?> get props => [
    name,
    faculty,
    degree,
    gender,
  ];
}

class CompanyProfileModel extends ProfileModel {
  const CompanyProfileModel({required super.name, required this.logo,});

  final String logo;

  @override
  List<Object?> get props => [
    name,
    logo,
  ];
}

StudentProfileModel myProfile1 = const StudentProfileModel(
  name: 'Lương Duy Đạt',
  studentId: '19020039',
  classId: 'K64C-CLC',
  facultyId: 'CN1',
);

List<TeacherProfileModel> lecturerList = [
  const TeacherProfileModel(
    name: 'Dương Lê Minh',
    faculty: 'Công nghệ thông tin',
    degree: 'Ts',
    gender: 'Nam',
  ),
  const TeacherProfileModel(
    name: 'Đoàn Thị Hoài Thu',
    faculty: 'Công nghệ thông tin',
    degree: 'Ths',
    gender: 'Nữ',
  ),
  const TeacherProfileModel(
    name: 'Hà Quang Thuỵ',
    faculty: 'Công nghệ thông tin',
    degree: 'PGS.TS',
    gender: 'Nam',
  ),
];

CompanyProfileModel fpt = const CompanyProfileModel(name: 'Công ty FPT' ,logo: 'assets/images/fpt-logo.jpg',);