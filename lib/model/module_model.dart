import 'package:equatable/equatable.dart';

class Module extends Equatable{
  const Module({required this.moduleId, required this.moduleName, required this.creditNumber, required this.faculty, this.type,});

  final String moduleId;
  final String moduleName;
  final int creditNumber;
  final String faculty;
  final String? type;

  @override
  List<Object?> get props => [
    moduleId,
    moduleName,
    creditNumber,
    type,
    faculty,
  ];
}

List<Module> moduleList = [
  const Module(
    moduleId: 'PHI 1004',
    moduleName: 'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',
    creditNumber: 2,
    type: 'Hoc lan dau',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'PHI 1005',
    moduleName: 'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',
    creditNumber: 3,
    type: 'Hoc lai',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'POL 1001',
    moduleName: 'Tư tưởng Hồ Chí Minh',
    creditNumber: 2,
    type: 'Hoc cai thien',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'HIS 1002',
    moduleName: 'Đường lối cách mạng của Đảng Cộng sản Việt Nam',
    creditNumber: 2,
    type: 'Hoc cai thien',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'PHI 1004',
    moduleName: 'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',
    creditNumber: 2,
    type: 'Hoc lan dau',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'PHI 1005',
    moduleName: 'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',
    creditNumber: 3,
    type: 'Hoc lan dau',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'POL 1001',
    moduleName: 'Tư tưởng Hồ Chí Minh',
    creditNumber: 2,
    type: 'Hoc lai',
    faculty: 'KHXH&NV',
  ),
  const Module(
    moduleId: 'HIS 1002',
    moduleName: 'Đường lối cách mạng của Đảng Cộng sản Việt Nam',
    creditNumber: 2,
    type: 'Hoc lai',
    faculty: 'KHXH&NV',
  ),
];