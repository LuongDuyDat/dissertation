import 'package:equatable/equatable.dart';

class TrainingProgram extends Equatable {
  const TrainingProgram({
    required this.logo,
    required this.name,
    required this.faculty,
  });

  final String logo;
  final String name;
  final String faculty;

  @override
  List<Object?> get props => [
    logo,
    name,
    faculty,
  ];
}

List<TrainingProgram> trainingProgramList = [
  const TrainingProgram(
    logo: 'assets/images/fit-logo.png',
    name: 'Công nghệ thông tin CLC',
    faculty: 'Công nghệ thông tin'
  ),
  const TrainingProgram(
    logo: 'assets/images/avitech.png',
    name: 'Công nghệ kỹ thuật điện tử – viễn thông CLC',
    faculty: 'Cơ điện tử',
  ),
  const TrainingProgram(
    logo: 'assets/images/aerospace.png',
    name: 'Kỹ thuật máy tính',
    faculty: 'Kỹ thuật máy tính'
  ),
  const TrainingProgram(
    logo: 'assets/images/fema.png',
    name: 'Kỹ thuật robot',
    faculty: 'Kỹ thuật robot'
  ),
  const TrainingProgram(
    logo: 'assets/images/logo_fet.png',
    name: 'Cơ kỹ thuật',
    faculty: 'Cơ kỹ thuật',
  ),
  const TrainingProgram(
    logo: 'assets/images/nong_nghiep.jpg',
    name: 'Công nghệ kỹ thuật xây dựng',
    faculty: 'Công nghệ kỹ thuật xây dựng',
  ),
  const TrainingProgram(
    logo: 'assets/images/physics.png',
    name: 'Công nghệ hàng không vũ trụ',
    faculty: 'Công nghệ hàng không vũ trụ',
  ),
];