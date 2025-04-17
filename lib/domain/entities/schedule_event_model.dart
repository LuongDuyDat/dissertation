import 'package:equatable/equatable.dart';

class ScheduleEventModel extends Equatable {
  const ScheduleEventModel({
    required this.type,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTIme,
  });

  //type = 0: class; type = 1: Assignment
  final int type;
  final String title;
  final String? description;
  final String startTime;
  final String endTIme;

  @override
  List<Object?> get props => [
    type,
    title,
    description,
    startTime,
    endTIme,
  ];
}

List<ScheduleEventModel> events = [
  const ScheduleEventModel(
    type: 0,
    title: 'Toán rời rạc',
    startTime: '11:00',
    endTIme: '13:00',
  ),
  const ScheduleEventModel(
    type: 0,
    title: 'Toán rời rạc',
    startTime: '13:00',
    endTIme: '15:00',
  ),
  const ScheduleEventModel(
    type: 1,
    title: 'Toán rời rạc',
    description: 'Học thuộc phần 2. Làm bài tập số 2: Nội dung se la',
    startTime: '11:00',
    endTIme: '13:00',
  ),
];