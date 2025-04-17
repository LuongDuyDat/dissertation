class StudentEntity {
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

  StudentEntity({
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
}