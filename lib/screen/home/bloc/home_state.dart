import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:learning_intern_support_system/model/module_model.dart';
import 'package:learning_intern_support_system/model/post_model.dart';
import 'package:learning_intern_support_system/model/training_program_model.dart';

enum TrainingProgramStatus {initial, loading, failure, success}
enum ModuleStatus {initial, loading, failure, success}
enum PostStatus {initial, loading, failure, success}
enum PostType {all, university, company}

class HomeState extends Equatable {
  const HomeState({
    this.trainingProgramStatus = TrainingProgramStatus.initial,
    this.moduleStatus = ModuleStatus.initial,
    this.postStatus = PostStatus.initial,
    this.postType = PostType.all,
    this.trainingPrograms = const [],
    this.modules = const [],
    this.posts = const [],
  });

  final TrainingProgramStatus trainingProgramStatus;
  final ModuleStatus moduleStatus;
  final PostStatus postStatus;
  final PostType postType;
  final List<TrainingProgram> trainingPrograms;
  final List<Module> modules;
  final List<PostModel> posts;

  HomeState copyWith({
    TrainingProgramStatus Function()? trainingProgramStatus,
    ModuleStatus Function()? moduleStatus,
    PostStatus Function()? postStatus,
    PostType Function()? postType,
    List<TrainingProgram> Function()? trainingPrograms,
    List<Module> Function()? modules,
    List<PostModel> Function()? posts,
  }) {
    return HomeState(
      trainingProgramStatus: trainingProgramStatus != null ? trainingProgramStatus() : this.trainingProgramStatus,
      moduleStatus: moduleStatus != null ? moduleStatus() : this.moduleStatus,
      postStatus: postStatus != null ? postStatus() : this.postStatus,
      postType: postType != null ? postType() : this.postType,
      trainingPrograms: trainingPrograms != null ? trainingPrograms() : this.trainingPrograms,
      modules: modules != null ? modules() : this.modules,
      posts: posts != null ? posts() : this.posts,
    );
  }

  @override
  List<Object?> get props => [
    trainingProgramStatus,
    moduleStatus,
    postStatus,
    postType,
    trainingPrograms,
    modules,
    posts,
  ];

}