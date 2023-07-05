import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLoadTrainingProgram extends HomeEvent{
  const HomeLoadTrainingProgram();
}

class HomeLoadModule extends HomeEvent{
  const HomeLoadModule();
}

class HomeLoadPost extends HomeEvent{
  const HomeLoadPost();
}

class HomeChangePostType extends HomeEvent{
  const HomeChangePostType({required this.type,});

  final int type;

  @override
  List<Object?> get props => [type];
}
