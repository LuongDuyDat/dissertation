import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class ModuleSchedule extends Equatable {
  const ModuleSchedule({
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.repeat,
    required this.location,
  });

  // type = 0: Ly thuyet, type = 1: thuc hanh
  final String type;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String repeat;
  final String location;

  @override
  List<Object?> get props => [
    type,
    startTime,
    endTime,
    repeat,
    location,
  ];
}

class ModuleInTerm extends Equatable {
  const ModuleInTerm({required this.moduleName, required this.color,});

  final String moduleName;
  final Color color;

  @override
  List<Object?> get props => [moduleName, color,];
}

List<ModuleInTerm> moduleInTermList = [
  const ModuleInTerm(
    moduleName: 'Bóng bàn',
    color: Colors.blue,
  ),
  const ModuleInTerm(
    moduleName: 'Cấu Trúc Dữ Liệu và Giải Thuật',
    color: Colors.yellow,
  ),
  const ModuleInTerm(
    moduleName: 'CNXHKH',
    color: Colors.purple,
  ),
  const ModuleInTerm(
    moduleName: 'Kiến trúc máy tính',
    color: Colors.red,
  ),
  const ModuleInTerm(
    moduleName: 'Lập trình hướng đối tượng',
    color: Colors.orangeAccent,
  ),
  const ModuleInTerm(
    moduleName: 'Nguyên Lý Marketing',
    color: Colors.yellow,
  ),
  const ModuleInTerm(
    moduleName: 'Xác suốt thống kê',
    color: Colors.green,
  ),
];

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